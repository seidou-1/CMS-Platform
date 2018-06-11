/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dao;

import com.sg.blogcms.dto.Category;
import com.sg.blogcms.dto.Post;
import com.sg.blogcms.dto.Tag;
import com.sg.blogcms.dto.User;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

/**
 *
 * @author laptop
 */
public class PostDaoDbImpl implements PostDAOInterface {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String SQL_INSERT_POST
            = "INSERT INTO`POSTS` (PostTitle, PostBody, PostDate, ExpirationDate, FeatureImage, CategoryID, UserID)\n"
            + "VALUES (?, ?, ?, ?, ?, ?, ?)";

    private static final String SQL_DELETE_POST
            = "DELETE FROM `POSTS` WHERE POSTID = ?";

    private static final String SQL_UPDATE_POST
            = "UPDATE `POSTS`\n"
            + "\n"
            + "SET PostTitle = ?, PostBody = ?, PostDate = ?, ExpirationDate = ?, FeatureImage = ?, CategoryID = ?, UserID = ? \n"
            + "\n"
            + "WHERE PostID = ?";

    private static final String SQL_SELECT_POST
            = "SELECT * FROM `POSTS` WHERE POSTID = ?";

    //Select Posts by....
    private static final String SQL_SELECT_POST_BY_DATE
            = "SELECT * FROM `POSTS` WHERE `POSTDATE` = ?";

    private static final String SQL_SELECT_POST_BY_USER
            = "SELECT USERNAME, USEREMAIL, POSTTITLE, POSTDATE FROM `USERS` \n"
            + "\n"
            + "RIGHT JOIN `POSTS`\n"
            + "\n"
            + "ON POSTS.POSTID = USERS.USERID";

    private static final String SQL_SELECT_POST_BY_CATEGORY
            = "SELECT CATEGORYNAME, POSTTITLE, POSTDATE FROM `CATEGORIES` \n"
            + "\n"
            + "RIGHT JOIN `POSTS`\n"
            + "\n"
            + "ON POSTS.CATEGORYID = CATEGORIES.CATEGORYID\n"
            + "\n"
            + "WHERE CATEGORYNAME = 'SKY SCRAPERS'";

    private static final String SQL_SELECT_POST_BY_TAGID //Mo: Can also change query to tag name. Will revisit
            = "SELECT TAGNAME, POSTTITLE, POSTDATE, POSTS_TAGS.TAGID FROM `POSTS_TAGS` \n"
            + "\n"
            + "INNER JOIN `POSTS`\n"
            + "\n"
            + "ON POSTS.POSTID = POSTS_TAGS.POSTID\n"
            + "\n"
            + "INNER JOIN `TAGS`\n"
            + "\n"
            + "ON TAGS.TAGID =  POSTS_TAGS.TAGID\n"
            + "\n"
            + "WHERE TAGS.TAGID = ?";

    private static final String SQL_SELECT_ALL_POSTS //This used to be lazy loading - we're not getting any other data. But now it's eager loading
            = "SELECT POSTS.* , CATEGORIES.CATEGORYNAME, USERS.*, TAGS.*FROM BBLTRAVELSTEST.POSTS \n"
            + "\n"
            + "INNER JOIN CATEGORIES ON CATEGORIES.CATEGORYID = POSTS.CATEGORYID\n"
            + "\n"
            + "INNER JOIN USERS ON USERS.USERID = POSTS.USERID\n"
            + "\n"
            + "LEFT  JOIN POSTS_TAGS ON POSTS.POSTID = POSTS_TAGS.POSTID\n"
            + "\n"
            + "LEFT JOIN TAGS ON TAGS.TAGID = POSTS_TAGS.TAGID";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)

    public Post addPost(Post post) {
        System.out.println(post.getPostTitle());
        jdbcTemplate.update(SQL_INSERT_POST,
                post.getPostTitle(),
                post.getPostBody(),
                post.getPostDate(),
                post.getExpirationDate(),
                post.getFeatureImage(),
                post.getCategoryId(),
                post.getUserId());

        /*
        The above creates the post
        
        The below queries the db for the id that was just assigned
        to the new row
         */
        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        //This sets the new id value on the Post object and returns it
        post.setPostId(newId);
        return post;

        //Pick up here.. UnitTest this method
    }

    @Override
    public void updatePost(Post post) {

        /*
        Mo: Order needs to match the prepared statements above
         */
        jdbcTemplate.update(SQL_UPDATE_POST,
                post.getPostTitle(),
                post.getPostBody(),
                post.getPostDate(),
                post.getExpirationDate(),
                post.getFeatureImage(),
                post.getCategoryId(),
                post.getUserId(),
                post.getPostId());

    }

    @Override
    public void deletePost(int postId) {
        jdbcTemplate.update(SQL_DELETE_POST, postId);
    }

    @Override
    public Post getPostById(int postId) {
//        jdbcTemplate.update(SQL_DELETE_POST, postId);//Shouldn't be Delte Post here...

        try {
            String SQLselect = SQL_SELECT_ALL_POSTS + "\n where POSTS.PostID = ?";
//            return jdbcTemplate.queryForObject(SQL_SELECT_POST, //This will mimic Select all posts but put a where in there. Use the same extractor
            List <Post> myPosts = jdbcTemplate.query(SQLselect, //This will mimic Select all posts but put a where in there. Use the same extractor
                    new PostMapExtractor(), postId);
            if (myPosts.size()== 0) {
                return null;
            }
            return myPosts.get(0); //Grab the only one in the index... 0
        } catch (EmptyResultDataAccessException ex) {

            return null; 
        }
    }

    @Override
    public List<Post> getAllPosts() {

        return jdbcTemplate.query(SQL_SELECT_ALL_POSTS, new PostMapExtractor());

    }

    @Override
    public List<Post> getPostsByDate(Date date) { //Varity method

        try {
            jdbcTemplate.query(SQL_SELECT_POST_BY_DATE,
                    new PostMapper(), date);
        } catch (DataAccessException ex) {
        }

        return null;
    }

    @Override
    public List<Post> getPostsByUser(int userId) { //Varify method
        try {
            jdbcTemplate.query(SQL_SELECT_POST_BY_USER,
                    new PostMapper(), userId);
        } catch (DataAccessException ex) {

        }

        return null;

    }

    @Override
    public List<Post> getPostsByCategory(int categoryId) {
        try {
            jdbcTemplate.query(SQL_SELECT_POST_BY_CATEGORY,
                    new PostMapper(), categoryId);
        } catch (DataAccessException ex) {

        }

        return null;

    }

    @Override
    public List<Post> getPostsByTag(int tagId) {
        try {
            jdbcTemplate.query(SQL_SELECT_POST_BY_TAGID,
                    new PostMapper(), tagId);
        } catch (DataAccessException ex) {

        }

        return null;

    }

    private static final class PostMapExtractor implements ResultSetExtractor<List<Post>> {

        /*
        Purpose of this is to... you get your result set (your data). Then 
        This helps perform Eager loading in that - you get all the data associated to a record
        if you have multipel joins in a one to many relationship, it will get all the associated data
        for that record
         */
        @Override
        public List<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {

            Map<Integer, Post> results = new HashMap<>();//within this
            //This will go to the next record and loop through the record set
            while (rs.next()) { //Loop through all the results (whichever query is ran.. like select all posts)
                int postId = rs.getInt("PostID");//This has to match the DB table spelling
                Post myPost = results.get(postId); //This checks our map to see if we already have that postId

                if (myPost == null) { //Meaning we haven't ran into this postId yet
                    
                    myPost = new Post();
                    
                    Category myCategory = new Category();
                    myCategory.setCategoryId(rs.getInt("CategoryID"));
                    myCategory.setCategoryName(rs.getString("CategoryName"));

                    User myUser = new User();
                    myUser.setUserId(rs.getInt("UserID"));
                    myUser.setUsername(rs.getString("UserName"));
                    myUser.setEmail(rs.getString("UserEmail"));
                    myUser.setUserPassword(rs.getString("UserPassword"));
                    myUser.setUserAvatar(rs.getString("UserAvatar"));

                    myPost.setPostId(postId);
                    myPost.setPostTitle(rs.getString("PostTitle"));
                    myPost.setPostBody(rs.getString("PostBody"));
                    myPost.setPostDate((rs.getDate("PostDate")));
                    myPost.setExpirationDate((rs.getDate("ExpirationDate")));
                    myPost.setFeatureImage((rs.getString("FeatureImage")));
                    myPost.setCategoryId((rs.getInt("CategoryID")));
                    myPost.setUserId((rs.getInt("UserID")));

                    //Now associate the Category and User with the Post
                    myPost.setCategory(myCategory);
                    myPost.setUser(myUser);

                    List<Tag> myTags = new ArrayList<>();

                    //An int cannot be set to null but Integer can
                    Integer myTagId = rs.getInt("TagID");

                    if (myTagId != null) { //Meaning i have a tag

                        Tag myTag = new Tag();
                        //I already have the Id.. hence this if statement condition being true

                        myTag.setTagId(myTagId);
                        myTag.setTagName(rs.getString("TagName"));

                        myTags.add(myTag);

                    }

                    myPost.setTag(myTags);

                    results.put(postId, myPost);

                    /*
                    We are eagerly taking all this data and "hydrating" our post object
                     */
                } //myPost if ends
                else {
                    Tag myTag = new Tag();

                    myTag.setTagId(rs.getInt("TagID"));
                    myTag.setTagName(rs.getString("TagName"));

                    //This returns a list of Tags
                    myPost.getTag().add(myTag);
                }
            } //Closes While loop

            return (List<Post>) results.values().stream().collect(Collectors.toList());
            //Values returns collections and collections is not an implementation of List
            //Results is the map, values are the values in the map
            //Streaming those values (like a for each)
        }

    }

    //Mapper
    private static final class PostMapper implements RowMapper<Post> {

        public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
            Post myPost = new Post();
            myPost.setPostId(rs.getInt("PostID"));//This has to match the DB table spelling
            myPost.setPostTitle(rs.getString("PostTitle"));
            myPost.setPostTitle(rs.getString("PostBody"));
            myPost.setPostDate((rs.getDate("PostDate")));
            myPost.setExpirationDate((rs.getDate("ExpirationDate")));
            myPost.setFeatureImage((rs.getString("FeatureImage")));
            myPost.setCategoryId((rs.getInt("CategoryID")));
            myPost.setUserId((rs.getInt("UserID")));

            return myPost;
        }

    }

}
