/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dto;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author laptop
 */
public class Tag {
    
    int tagId;
    String tagName;
    List <Tag> tag;
    
    Category category;
    User user;

    public int getTagId() {
        return tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public List<Tag> getTag() {
        return tag;
    }

    public Category getCategory() {
        return category;
    }

    public User getUser() {
        return user;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public void setTag(List<Tag> tag) {
        this.tag = tag;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
    
    
}
