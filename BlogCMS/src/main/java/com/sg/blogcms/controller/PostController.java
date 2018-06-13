/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.controller;

import com.sg.blogcms.dao.PostDAOInterface;
import com.sg.blogcms.dao.TagDAOInterface;
import com.sg.blogcms.service.PostServiceInterface;
import com.sg.blogcms.service.TagServiceInterface;
import com.sg.blogcms.dto.Post;
import com.sg.blogcms.service.PostServiceInterface;
import java.sql.Date;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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

    @Inject
    public PostController (PostServiceInterface postService){
        this.postService = postService;
    }

    @RequestMapping(value = {"/viewPosts"}, method = RequestMethod.GET)
    public String loadPosts(HttpServletRequest request, Model model) {

        //Getting all Posts from the dao
        List<Post> allPosts = postService.getAllPosts();
        
//        Post myPost = new Post();
//        
//        myPost

        //Adding List of Posts into the Model  
        model.addAttribute("posts", allPosts);
        return "viewPosts"; //returning the logical view - the posts.jsp page
    }

    @RequestMapping(value = {"/createPost"}, method = RequestMethod.POST)
    public String createPost(HttpServletRequest request, Model model) {
        Post myPost = new Post();
        myPost.setPostTitle(request.getParameter("postTitle"));
        myPost.setPostBody(request.getParameter("postBody"));
        myPost.setPostDate(Date.valueOf(request.getParameter("postDate")));
        myPost.setExpirationDate(Date.valueOf(request.getParameter("expirationDate")));
        myPost.setFeatureImage(request.getParameter("featuredImage"));
        myPost.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        myPost.setUserId(Integer.parseInt(request.getParameter("userId")));
        postService.addPost(1, myPost);
        
        /*
        In order to use the attribute for this respective end point, we have to include
        the attribute for this end point
        */
        
        //Getting all Posts from the dao
        List<Post> allPosts = postService.getAllPosts();
        
        model.addAttribute("posts", allPosts);
        
        return "redirect: createPost";
    }
    
    @RequestMapping(value = {"/createPost"}, method = RequestMethod.GET)
    public String addPost(HttpServletRequest request, Model model) {

        model.addAttribute("posts", postService.getAllPosts());
        
//        Post myPost = new Post();
//        myPost.setPostTitle(request.getParameter("postTitle"));
//        myPost.setPostTitle(request.getParameter("postBody"));
//        myPost.setPostDate(Date.valueOf(request.getParameter("postDate")));
//        myPost.setExpirationDate(Date.valueOf(request.getParameter("expirationDate")));
//        myPost.setFeatureImage(request.getParameter("featuredImage"));
//        myPost.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
//        myPost.setUserId(Integer.parseInt(request.getParameter("userId")));

        return "createPost";
    }

    @RequestMapping(value = {"/deletePost"}, method = RequestMethod.GET)
    public String deletePost(HttpServletRequest request, Model model) {

        int postId = Integer.parseInt(request.getParameter("postId"));
        postService.deletePost(postId, postId);//After User CRUD created, swap first parameter with loginUserId
        return "redirect:viewPosts";
    }

    @RequestMapping (value = {"/displayEditPostForm"}, method = RequestMethod.GET)
    public String displayEditPostForm (HttpServletRequest request, Model model){
        String postIdParameter = request.getParameter("postId");       
        int postIdConverted = Integer.parseInt(postIdParameter);
        return "editPost";
    }
    
    @RequestMapping (value = {"/editPost"}, method = RequestMethod.POST)
    public String editPost (@Valid @ModelAttribute("contact") Post post, BindingResult result) {
        
        if (result.hasErrors()) {
            return "editPost";
        }
        
       postService.updatePost(0, post); //Update this method to replace the first parameter with userId
       
       return "redirect:viewPosts";
    }
}
