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
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author laptop
 */

// Changed from Controller to PostController -  keyword
public class PostController {
    
    //Mo: might move this to it's own controller if needed. We'll see how things go.
    PostServiceInterface postServiceInterface;
    TagDAOInterface tagDAOInterface;
    TagServiceInterface tagServiceInterface;
    
    @Inject
    public PostController (PostServiceInterface postServiceInterface){
        this.postServiceInterface = postServiceInterface;
    }
    
    @RequestMapping(value = {"/viewPosts"}, method = RequestMethod.GET)
    public String loadPosts (HttpServletRequest request, Model model){

    
    List <Post> allPosts = postServiceInterface.getAllPosts();
//    List <Post> postsByCategory = postServiceInterface.getPostsByCategory();
    //Maybe include a List option to display posts by category
      
    model.addAttribute("posts", allPosts);
        return "posts"; //returning the logical view - the posts.jsp page
    }
    
    @RequestMapping (value = {"/createPost"}, method = RequestMethod.POST)
    public String createPost (HttpServletRequest request, Model model){
        
        Post myPost = new Post();
        myPost.setPostTitle(request.getParameter(""));
        
                
    //Mo: pick up from here. Continue...
    
    return "redirect: viewPosts";
    }
}

