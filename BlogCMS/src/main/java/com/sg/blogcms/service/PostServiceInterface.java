/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.service;

import com.sg.blogcms.dto.Post;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author laptop
 */
public interface PostServiceInterface {
//loginUserId is the actual user logged in and userId is the person you want to perform the action on
    
    public Post addPost (int loginUserId, Post post);
    
    public void updatePost (int loginUserId, Post post);
    
    public void deletePost(int loginUserId, int postId);
    
    public Post getPostById (int postId);
    
    List <Post> getAllPosts();
    
    List <Post> getPostsByDate (Date date);
    
    List <Post> getPostsByUser (int userId);
    
    List <Post> getPostsByCategory (int categoryId);
    
    List <Post> getPostsByTag (int tagId);
    
}
