/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dao;

import com.sg.blogcms.dto.Tag;
import java.util.List;

/**
 *
 * @author laptop
 */
public interface TagDAOInterface {
    
    public Tag addTag (Tag tag);
    
    public Tag updateTag (int tagId);
    
    public void deleteTag (int tagId);
    
    public List <Tag> getAllTags();
    
    public Tag getTagById (int tagId);
}
