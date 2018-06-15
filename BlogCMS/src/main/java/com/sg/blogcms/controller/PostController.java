/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.controller;

import com.sg.blogcms.dto.Category;
import com.sg.blogcms.dto.Post;
import com.sg.blogcms.dto.Tag;
import com.sg.blogcms.dto.User;
import com.sg.blogcms.service.CategoryServiceInterface;
import com.sg.blogcms.service.PostServiceInterface;
import com.sg.blogcms.service.TagServiceInterface;
import com.sg.blogcms.service.UserServiceInterface;
import java.sql.Date;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author laptop
 */

// Changed from Controller to PostController -  keyword
@Controller
public class PostController {
    
    //Mo: might move this to it's own controller if needed. We'll see how things go.
    PostServiceInterface postService;
    UserServiceInterface userService;
    CategoryServiceInterface categoryService;
    TagServiceInterface tagService;

    @Inject
    public PostController (PostServiceInterface postService, UserServiceInterface userService, TagServiceInterface tagService ,CategoryServiceInterface categoryService){
        this.postService = postService;
        this.userService = userService;
        this.tagService = tagService;
        this.categoryService = categoryService;
    }

    @RequestMapping(value = {"/viewPosts"}, method = RequestMethod.GET)
    public String loadPosts(HttpServletRequest request, Model model) {

        //Getting all Posts from the dao
        List<Post> allPosts = postService.getAllPosts();
        

        model.addAttribute("posts", allPosts);
        return "viewPosts"; //returning the logical view - the posts.jsp page
    }
    
    @RequestMapping(value = {"/viewSinglePost"}, method = RequestMethod.GET)
    public String getSinglePost(HttpServletRequest request, Model model){
        
        String display = (request.getParameter("display"));
        model.addAttribute("display", display);

        int postId = Integer.parseInt(request.getParameter("postId"));
        Post myPost = postService.getPostById(postId);
        
        model.addAttribute("myPost", myPost);
        
        return "viewPosts";
  
    }
    
    @RequestMapping(value = {"/choosePostToEdit"}, method = RequestMethod.GET)
    public String choosePostToEdit (HttpServletRequest request, Model model){
        
        String display = (request.getParameter("display"));
        model.addAttribute("display", display);

        int postId = Integer.parseInt(request.getParameter("postId"));
        Post myPost = postService.getPostById(postId);
        
        model.addAttribute("myPost", myPost);
        
        return "viewPosts";
  
    }
    
    @RequestMapping (value = {"/editPost"}, method = RequestMethod.POST)
    public String editPost (HttpServletRequest request, Model model) {
//        
//        if (result.hasErrors()) {
//            return "editPost";
//        }
        
        int postId = Integer.parseInt(request.getParameter("postId"));
        Post myPost = postService.getPostById(postId);
        
        myPost.setPostTitle(request.getParameter("postTitle"));
        myPost.setPostBody(request.getParameter("postBody"));
        myPost.setPostDate(Date.valueOf(request.getParameter("postDate")));
        myPost.setExpirationDate(Date.valueOf(request.getParameter("expirationDate")));
        myPost.setFeatureImage(request.getParameter("featuredImage"));
        myPost.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        myPost.setUserId(Integer.parseInt(request.getParameter("userId")));
        
       postService.updatePost(myPost.getUserId(), myPost); //Update this method to replace the first parameter with userId
       
       return "redirect:viewPosts/"; //edit later`
    }
    
    /*
        In order to use the attribute for this respective end point, we have to include
        the attribute for this end point below:
        */
    @RequestMapping (value = {"/createPost"}, method = RequestMethod.GET)
    public String displyCreatePostPage(HttpServletRequest request, Model model) {
                //Getting all Posts from the dao

        List<Post> allPosts = postService.getAllPosts();
        List<Category> allCategories = categoryService.getAllCategories();
        List<Tag> allTags = tagService.getAllTags();
        
        
        
        
        model.addAttribute("allCategories", allCategories);
        model.addAttribute("allTags", allTags);
        model.addAttribute("allPosts", allPosts);
        
        return"createPost";
    }
    
    @RequestMapping(value = {"/createPost"}, method = RequestMethod.POST)
    public String createPost(HttpServletRequest request, Model model) {
        String username = (request.getParameter("username"));
        Post myPost = new Post();
        myPost.setPostTitle(request.getParameter("postTitle"));
        myPost.setPostBody(request.getParameter("postBody"));
        myPost.setPostDate(Date.valueOf(request.getParameter("postDate")));
        myPost.setExpirationDate(Date.valueOf(request.getParameter("expirationDate")));
        myPost.setFeatureImage(request.getParameter("featuredImage"));
        myPost.setCategoryId(Integer.parseInt(request.getParameter("category")));
        
        
        String [] temp = request.getParameterValues("tags");
        
        for (String tagId  : temp){
            Tag tag = tagService.getTagById(Integer.parseInt(tagId));
            myPost.addTag(tag);
        }
        
        
////        myPost.setTag(request.getParameterValues("tags") );
//        postService.addTagsAndPostToDatbase(temp,myPost);
//        dao.addTagAndPostToDatabse(temp,myPost);
//        addTagAndPostToDatabase{
//            for()
//        }
        
        User user = userService.getUserByUsername(username);
        
        myPost.setUser(user); //use at some point
        myPost.setUserId(user.getUserId());
        
//        List<User> allUsers = userService.getAllUsers();
//        allUsers = allUsers
//               .stream()
//               .filter(s -> s.getUsername() == username)
//               .collect(Collectors.toList());
//        User user = allUsers.get(0);

//Above method was the lazy way to stream the username and then get the user by id. Just created a prepared statement
        
        postService.addPost(user.getUserId(), myPost);
         
        
        //Getting all Posts from the dao
        List<Post> allPosts = postService.getAllPosts();
        

        model.addAttribute("posts", allPosts);
        return "viewPosts"; //returning the logical view - the posts.jsp page
        
    }

    @RequestMapping(value = {"/deletePost"}, method = RequestMethod.GET)
    public String deletePost(HttpServletRequest request, Model model) {

        int postId = Integer.parseInt(request.getParameter("postId"));
        postService.deletePost(postId, postId);//After User CRUD created, swap first parameter with loginUserId
        return "redirect:viewPosts";
    }

   
    
}
