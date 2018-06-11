/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms;

import com.sg.blogcms.dao.CategoryDAOInterface;
import com.sg.blogcms.dao.PostDAOInterface;
import com.sg.blogcms.dao.TagDAOInterface;
import com.sg.blogcms.dao.UserDAOInterface;
import com.sg.blogcms.dto.Category;
import com.sg.blogcms.dto.Post;
import com.sg.blogcms.dto.Tag;
import com.sg.blogcms.dto.User;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author laptop
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/test-applicationContext.xml"})
@Rollback
@Transactional

/*
Rollback - when each test is complete, roll back all the changes performed

Transactional - keeps all the tests in one transaction so it can roll back 
the entire test as one transaction
 */
public class PostDAOUnitTest {

    @Inject
    private PostDAOInterface postDao;
    @Inject
    private CategoryDAOInterface categoryDao;
    @Inject
    private UserDAOInterface userDao;
    @Inject
    private TagDAOInterface tagDao;

    /*
    Above is spring annotation. Auto magic stuff.
     */
    public PostDAOUnitTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
//  No longer need to clear out everything
//        
//        ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
//        
//   //Variable name           Bean name    Dao Interface
//        postDao = ctx.getBean("postDao", PostDAOInterface.class);
//        
//        categoryDao = ctx.getBean("categoryDao", CategoryDAOInterface.class);
//        
//        userDao = ctx.getBean("userDao", UserDAOInterface.class);
//        
//        tagDao = ctx.getBean("tagDao", TagDAOInterface.class);
//        
//        
//        //Clear out Post data from DAO        
//        List<Post> posts = postDao.getAllPosts();
//        
//        for (Post currentPost : posts){
//            postDao.deletePost(currentPost.getPostId());
//        }
//        
//        //Clear out Tag from DAO
//        List<Tag> tags = tagDao.getAllTags();
//        
//        for (Tag currentTag : tags){
//            tagDao.deleteTag(currentTag.getTagId());
//        }
//      
//        //Clear out User from DAO
//        List<User> users = userDao.getAllUsers();
//        
//        for (User currentUser : users){
//            userDao.deleteUser(currentUser.getUserId());
//        }
//               
//        //Clear out Category from DAO
//        List<Category> categories = categoryDao.getAllCategories();
//        
//        for (Category currentCategory : categories) {
//            categoryDao.deleteCategory(currentCategory.getCategoryId());
//        }

    }

    @Test
    public void testCreatePost() throws ParseException {
        /*
        This method tests to make sure what's asserted here matches
        exactly with the createPost method down below
         */

        //Arrange
        Category myCategory = createCategory();

        User myUser = createUser();

        Post myPost = createPost(myCategory, myUser);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateStr;
        
        java.sql.Date dateDB = null;
        try {
            dateStr = formatter.parse("2018-03-20");
            dateDB = new java.sql.Date(dateStr.getTime());
            
        } catch (ParseException ex) {
            Logger.getLogger(PostDAOUnitTest.class.getName()).log(Level.SEVERE, null, ex);
        }

        //Act
        myPost = postDao.addPost(myPost); //cool 

        //Assert
        assert myPost.getPostTitle().equals("Water boy");
        assert myPost.getPostBody().equals("Post body text");
        assert myPost.getPostDate().equals(dateDB); //How do i varify dates?
        assert myPost.getExpirationDate().equals(dateDB); //How do i varify dates?
        assert myPost.getPostId() != 0; //shorthand for assert true. As long as we have an ID back.
        assert myPost.getUserId() == (myUser.getUserId()); //When you get a cannot be referenced error, change to "==" instead of .equals
        assert myPost.getCategoryId() == (myCategory.getCategoryId());
        assert myPost.getCategory().getCategoryName().equals(myCategory.getCategoryName());
    }

    @Test
    public void testGetPostById() {
        //Arrange
        Category myCategory = createCategory();

        User myUser = createUser();

        Post myPost = createPost(myCategory, myUser);

        myPost = postDao.addPost(myPost); //cool 

        //Act
        Post myReadPost = postDao.getPostById(myPost.getPostId());

        //Assert
        assert myReadPost.getPostId() == myPost.getPostId();//Do this for every get (title, body, etc)

        assert myReadPost.getFeatureImage().equals(myPost.getFeatureImage()); //Taking 159 (the act and compareing it here)

        assert myReadPost.getPostBody().equals(myPost.getPostBody());

        assert myReadPost.getCategory().getCategoryName().equals(myCategory.getCategoryName());

        assert myReadPost.getCategory().getCategoryId() == myCategory.getCategoryId();
        //Do this for each remaining member field
    }

    @Test
    public void testDeletePost() {
        //Arrange
        Category myCategory = createCategory();

        User myUser = createUser();

        Post myPost = createPost(myCategory, myUser);

        myPost = postDao.addPost(myPost); //cool 

        //Act
        postDao.deletePost(myPost.getPostId());

        assert postDao.getPostById(myPost.getPostId()) == null;
    }

    @Test
    public void testUpdatePost() {
        //Arrange
        Category myCategory = createCategory();

        User myUser = createUser();

        Post myPost = createPost(myCategory, myUser);

        myPost = postDao.addPost(myPost); //cool 

        //Changes:
        myPost.setPostTitle("a brand new title");
        //Do this for each member property. Best practice to change all of them

        //Act
        postDao.updatePost(myPost);

        Post myUpdatedPost = postDao.getPostById(myPost.getPostId());

        //Assert
        assert myUpdatedPost.getPostTitle().equals("a brand new title");
        //I would do this for each change i made from line 194 (before a brand new title)

        List<Post> myPostByCategory = new ArrayList<>();

        /*
        For every method in the dao, have a unit test for it
        For every method in the service, have a unit test for it
         */
    }

//    @Test
    public void addGetDeletePost() throws ParseException {
        /*
        Since Post has foreign keys from Categories and Users, I will create
        Category and User objects first to get CategoryId and UserId first
         */

        //Create Category
        Category myCategory = new Category();
        myCategory.setCategoryName("snowflakes");
        categoryDao.addCategory(myCategory);
        Category categoryIdFromDB = categoryDao.getCategoryById(myCategory.getCategoryId());

        //Create User
        User myUser = new User();
        myUser.setEmail("myemail@email.com");
        myUser.setUserAvatar("red fox");
        myUser.setUserPassword("password");
//        myUser.setUserType(1);
        myUser.setUsername("admin");
        userDao.addUser(myUser);
        User userIdFromDB = userDao.getUserById(myUser.getUserId());

        //Create Post
        Post myPost = new Post();
        myPost.setPostTitle("Water boy");

        //Format this properly to match DB
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM--dd");
        java.util.Date dateStr = formatter.parse("2018-03-20");
        java.sql.Date dateDB = new java.sql.Date(dateStr.getTime());

        myPost.setPostDate(dateDB);
        myPost.setExpirationDate(dateDB);
        myPost.setFeatureImage("Image stuff");

        myPost.setCategoryId(categoryIdFromDB.getCategoryId());
        myPost.setUserId(userIdFromDB.getUserId());

        postDao.addPost(myPost);

        //Get Post Id from Database
        Post postIdFromDB = postDao.getPostById(myPost.getPostId());

        //Check to see if it's in the database
        assertEquals(postIdFromDB, myPost);

        //Check to see if i can delete Post
//        postDao.deletePost(myPost.getPostId());
//        
//        //Check to see if i can delete User
//        userDao.deleteUser(myUser.getUserId());
//        
//        //Check to see if i can delete Category
//        categoryDao.deleteCategory(myCategory.getCategoryId());
//
//        assertNull(postDao.getPostById(myPost.getPostId()));
    }

    //@Test
    public void addGetUpdatePost() throws ParseException {
        Post myPost = new Post();

        myPost.setPostTitle("Water boy");

        //Format this properly to match DB
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM--dd");
        java.util.Date dateStr = formatter.parse("2018-03-20");
        java.sql.Date dateDB = new java.sql.Date(dateStr.getTime());

        myPost.setPostDate(dateDB);
        myPost.setExpirationDate(dateDB);
        myPost.setFeatureImage("Image stuff");

//        Pick up here.. add these two after User and Category have been implemented
//        myPost.setCategoryId(0);
//        myPost.setUserId(0);
        postDao.addPost(myPost);

        //Make change to the date:
        myPost.setPostTitle("New title");

        //Call update method
        postDao.updatePost(myPost);

    }

    // @Test
    public void getAllPosts() throws ParseException {

        Post myPost = new Post();

        myPost.setPostTitle("Water boy");

        //Format this properly to match DB
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM--dd");
        java.util.Date dateStr = formatter.parse("2018-03-20");
        java.sql.Date dateDB = new java.sql.Date(dateStr.getTime());

        myPost.setPostDate(dateDB);
        myPost.setExpirationDate(dateDB);
        myPost.setFeatureImage("Image stuff");

//        Pick up here.. add these two after User and Category have been implemented
//        myPost.setCategoryId(0);
//        myPost.setUserId(0);
        postDao.addPost(myPost);

        List<Post> entireList = postDao.getAllPosts();
        assertEquals(entireList.size(), 1);

    }

    @After
    public void tearDown() {
    }

    private Category createCategory() {
        Category myCategory = new Category();
        myCategory.setCategoryName("snowflakes");
        myCategory = categoryDao.addCategory(myCategory);

        return myCategory;

    }

    private User createUser() {
        User myUser = new User();
        myUser.setUsername("molife");
        myUser.setEmail("myemail@email.com");
        myUser.setUserPassword("1");
        myUser.setUserAvatar("red fox");
        myUser.setEnabled(true);
        myUser = userDao.addUser(myUser);

        return myUser;
    }

    private Post createPost(Category myCategory, User myUser) {
        Post myPost = new Post();

        myPost.setPostTitle("Water boy");
        myPost.setPostBody("Post body text");

        //Format this properly to match DB
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateStr;
        try {
            dateStr = formatter.parse("2018-03-20");
            java.sql.Date dateDB = new java.sql.Date(dateStr.getTime());
            myPost.setPostDate(dateDB);
            myPost.setExpirationDate(dateDB);
        } catch (ParseException ex) {
            Logger.getLogger(PostDAOUnitTest.class.getName()).log(Level.SEVERE, null, ex);
        }

        myPost.setFeatureImage("Image stuff");
        
        myPost.setCategory(myCategory);//Need to set category first otherwise null pointer
        myPost.setCategoryId(myCategory.getCategoryId());
        
        myPost.setUser(myUser);//Same
        myPost.setUserId(myUser.getUserId());
        //No need to set postId because the DAO does it for me
        return myPost;
    }
}
