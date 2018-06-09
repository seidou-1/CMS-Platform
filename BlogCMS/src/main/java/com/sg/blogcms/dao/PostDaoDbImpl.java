/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dao;

import com.sg.blogcms.dto.Post;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

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

    private static final String SQL_SELECT_ALL_POSTS
            = "SELECT * FROM `POSTS`";

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
        jdbcTemplate.update(SQL_DELETE_POST, postId);

        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_POST,
                    new PostMapper(), postId);

        } catch (EmptyResultDataAccessException ex) {

            return null;
        }
    }

    @Override
    public List<Post> getAllPosts() {

        return jdbcTemplate.query(SQL_SELECT_ALL_POSTS, new PostMapper());

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
