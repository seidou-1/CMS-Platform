/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.controller;

import com.sg.blogcms.dto.Tag;
import com.sg.blogcms.service.TagServiceInterface;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import static org.springframework.http.RequestEntity.post;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Blackfox
 */
public class TagController {
    
    TagServiceInterface tagServiceInterface;
    
    @Inject
    public TagController (TagServiceInterface tagServiceInterface) {
    this.tagServiceInterface = tagServiceInterface;
    
}
    
    @RequestMapping(value = {"/viewTags"}, method = RequestMethod.GET)
    public String loadTags(HttpServletRequest request, Model model) {
        
        // This will grab all the Tags from the Dao
      
        // Ask mo if this is supposed to grab tags by Id or grab all of them
        List <Tag> allTags = tagServiceInterface.getAllTags();
        model.addAttribute("tag", allTags);
                
        // will return from tags
        return "tags"; 
    }
    
    
        @RequestMapping(value = {"/createTag"}, method = RequestMethod.POST)//Is this supposed to be post)
        public String createTag(HttpServletRequest request, Model model) {
        
        Tag Tag = new Tag();
        // This will convert the String id parse converts 
        Tag.setTagId(Integer.parseInt(request.getParameter("TagId")));
        
        Tag.setTagName(request.getParameter("TagName"));
        return "redirect:viewTags";
        
    }
              
     @RequestMapping(value = {"/deleteTag"}, method = RequestMethod.GET)
      public String deleteTag(HttpServletRequest request, Model model) {        
             
        int tagId = Integer.parseInt(request.getParameter("tagId"));
             tagServiceInterface.deleteTag(tagId, tagId);
             return "redirect:viewTags";
    }     
    
        

     @RequestMapping(value = "/editTag", method = RequestMethod.POST)
     public String editTag (@Valid @ModelAttribute(/**contact**/) Tag tag, BindingResult result) {
     
         
  
         
         if (result.hasErrors()) {
            return "edittag";
            }
            
     
        
        return "redirect:viewTags";
}

}