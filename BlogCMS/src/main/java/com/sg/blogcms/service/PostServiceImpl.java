/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.service;

import com.sg.blogcms.dao.PostDAOInterface;
import com.sg.blogcms.dto.Post;
import java.sql.Date;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author laptop
 */
public class PostServiceImpl implements PostServiceInterface {

    PostDAOInterface postDAOInterface;

    @Inject
    public PostServiceImpl(PostDAOInterface postDAOInterface) {
        this.postDAOInterface = postDAOInterface;
    }

    @Override
    public Post addPost(int loginUserId, Post post) {
        return postDAOInterface.addPost(post);
    }

    @Override
    public void updatePost(int loginUserId, Post post) {
        postDAOInterface.updatePost(post);
    }

    @Override
    public void deletePost(int loginUserId, int postId) {
        postDAOInterface.deletePost(postId);
    }

    @Override
    public Post getPostById(int postId) {
        return postDAOInterface.getPostById(postId);
    }

    @Override
    public List<Post> getAllPosts() {
        return postDAOInterface.getAllPosts();

    }

    @Override
    public List<Post> getPostsByDate(Date date) {
        return postDAOInterface.getPostsByDate(date);
    }

    @Override
    public List<Post> getPostsByUser(int userId) {
       return postDAOInterface.getPostsByUser(userId);
    }

    @Override
    public List<Post> getPostsByCategory(int categoryId) {
        return postDAOInterface.getPostsByCategory(categoryId);
    }

    @Override
    public List<Post> getPostsByTag(int tagId) {
        return postDAOInterface.getPostsByTag(tagId);
    }

}
