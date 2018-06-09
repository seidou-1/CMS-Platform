/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.service;

import com.sg.blogcms.dao.TagDAOInterface;
import com.sg.blogcms.dto.Tag;
import java.util.List;

/**
 *
 * @author Blackfox
 */
public class TagServiceImpl implements TagServiceInterface {
    
    TagDAOInterface tagDAOInterface;


    
    @Override
    public Tag addTag(int loginUserId, Tag tag) {
       this.tagDAOInterface =  tagDAOInterface; 
        return tagDAOInterface.addTag(tag);
    }

    @Override
    public void updateTag(int loginUserId, int tagId) {
     tagDAOInterface.updateTag(tagId);
    
}
    @Override
    public void deleteTag(int loginUserId, int tagId) {
       tagDAOInterface.deleteTag(tagId);
    }

    @Override
    public List<Tag> getAllTags() {
        return tagDAOInterface.getAllTags();
    }

    @Override
    public Tag getTagById(int tagId) {
       return tagDAOInterface.getTagById(tagId);
    }
    
}
