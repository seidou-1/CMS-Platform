/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.service;

import com.sg.blogcms.dao.TagDAOInterface;
import com.sg.blogcms.dto.Tag;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Blackfox
 */
public class TagServiceImpl implements TagServiceInterface {
    
    private TagDAOInterface tagDao;
    
    @Inject
    public TagServiceImpl(TagDAOInterface tagDao) {
        this.tagDao = tagDao;
    }



    
    @Override
    public Tag addTag(int loginUserId, Tag tag) {
        return tagDao.addTag(tag);
    }

    @Override
    public void updateTag(int loginUserId, int tagId) {
     tagDao.updateTag(tagId);
    
}
    @Override
    public void deleteTag(int loginUserId, int tagId) {
       tagDao.deleteTag(tagId);
    }

    @Override
    public List<Tag> getAllTags() {
        return tagDao.getAllTags();
    }

    @Override
    public Tag getTagById(int tagId) {
       return tagDao.getTagById(tagId);
    }

    @Override
    public List<Tag> getTagsByUser(int userId) {
        return tagDao.getTagByUser(userId);
    }
    
}
