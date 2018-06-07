/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms;

import com.sg.blogcms.dao.PostDAOInterface;
import com.sg.blogcms.dto.Post;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author laptop
 */
public class PostDAOUnitTest {
    
    private PostDAOInterface dao;
    
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
        
        dao = ctx.getBean("postDAOInterface", PostDAOInterface.class);
        
        //Clear out Post data from DAO        
        List<Post> posts = dao.getAllPosts();
        
        for (Post currentPost : posts){
            dao.deletePost(currentPost.getPostId());
        }
        
        //Clear out Tag from DAO
      
        //Clear out User from DAO
               
        //Clear out Category from DAO
        
    }
    
    //@Test
    public void addGetDeletePost() throws ParseException{
        //Create Category
        
        //Create User
        
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
  
//        Pick up here.. add these two after User and Category have been implemented
//        myPost.setCategoryId(0);
//        myPost.setUserId(0);

        dao.addPost(myPost);
        
        List<Post> entireList = dao.getAllPosts();
        assertEquals(entireList.size(), 1);
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

        dao.addPost(myPost);
        
        //Make change to the date:
       myPost.setPostTitle("New title");
       
       //Call update method
       dao.updatePost(myPost);

        
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

        dao.addPost(myPost);
        
        List<Post> entireList = dao.getAllPosts();
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
