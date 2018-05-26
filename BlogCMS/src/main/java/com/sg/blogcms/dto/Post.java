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
public class Post {
    int postId;
    String postTitle;
    Date postDate;
    Date expirationDate;
    String featureImage;
    List <Tag> tag;
    
    Category category;
    User user;
    
    
}
