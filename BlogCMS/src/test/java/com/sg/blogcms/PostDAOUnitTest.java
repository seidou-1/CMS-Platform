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
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import org.junit.Before;
import org.junit.BeforeClass;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author laptop
 */
public class PostDAOUnitTest {
    
    private PostDAOInterface postDao;
    private CategoryDAOInterface categoryDao;
    private UserDAOInterface userDao;
    private TagDAOInterface tagDao;
    
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
        
        ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
        
   //Variable name           Bean name    Dao Interface
        postDao = ctx.getBean("postDao", PostDAOInterface.class);
        
        categoryDao = ctx.getBean("categoryDao", CategoryDAOInterface.class);
        
        userDao = ctx.getBean("userDao", UserDAOInterface.class);
        
        tagDao = ctx.getBean("tagDao", TagDAOInterface.class);
        
        
        //Clear out Post data from DAO        
        List<Post> posts = postDao.getAllPosts();
        
        for (Post currentPost : posts){
            postDao.deletePost(currentPost.getPostId());
        }
        
        //Clear out Tag from DAO
        List<Tag> tags = tagDao.getAllTags();
        
        for (Tag currentTag : tags){
            tagDao.deleteTag(currentTag.getTagId());
        }
      
        //Clear out User from DAO
        List<User> users = userDao.getAllUsers();
        
        for (User currentUser : users){
            userDao.deleteUser(currentUser.getUserId());
        }
               
        //Clear out Category from DAO
        List<Category> categories = categoryDao.getAllCategories();
        
        for (Category currentCategory : categories) {
            categoryDao.deleteCategory(currentCategory.getCategoryId());
        }
        
    }
    
    //@Test
    public void addGetDeletePost() throws ParseException{
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
        myUser.setUserType(1);
        myUser.setUsername("admin");
        userDao.addUser(myUser);
        User userIdFromDB = userDao.getUserById(myUser.getUserId()); 
        
        //Create Post
        Post myPost = new Post();        
        myPost.setPostTitle("Water boy");
        
        //Format this properly to match DB
        SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM--dd");
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
        postDao.deletePost(myPost.getPostId());
        
        //Check to see if i can delete User
        userDao.deleteUser(myUser.getUserId());
        
        //Check to see if i can delete Category
        categoryDao.deleteCategory(myCategory.getCategoryId());

        assertNull(postDao.getPostById(myPost.getPostId()));

    }
    
    //Test
    public void addGetUpdatePost() throws ParseException {
        Post myPost = new Post();
        
        myPost.setPostTitle("Water boy");
        
        //Format this properly to match DB
        SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM--dd");
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
    public void getAllPosts() throws ParseException{
        
        Post myPost = new Post();
        
        myPost.setPostTitle("Water boy");
        
        //Format this properly to match DB
        SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM--dd");
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

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
