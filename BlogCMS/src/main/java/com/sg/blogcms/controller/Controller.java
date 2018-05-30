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
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author laptop
 */
public class Controller {
    
    //Mo: might move this to it's own controller if needed. We'll see how things go.
    PostDAOInterface postDAOInterface;
    PostServiceInterface postServiceInterface;
    TagDAOInterface tagDAOInterface;
    TagServiceInterface tagServiceInterface;
    
    @Inject
    public Controller (PostServiceInterface postServiceInterface){
        this.postServiceInterface = postServiceInterface;
    }
    
    @RequestMapping(value = {"/viewPosts"}, method = RequestMethod.GET)
    public String loadPosts (HttpServletRequest request, Model model){
        
    //Mo: pick up from here. Continue...

        
        return "posts";
        
        
    @Inject
    public Controller (TagServiceInterface tagServiceInterface){
        this.tagServiceInterface = tagServiceInterface;
    }
    
    @RequestMapping(value = {"/viewTags"}, method = RequestMethod.GET)
    public String loadTags (HttpServletRequest request, Model model){
        
  

        
        return "tags";
    }
}
