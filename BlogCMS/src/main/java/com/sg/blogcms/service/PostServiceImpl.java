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

    PostDAOInterface postDaoDbImpl;

    @Inject
    public PostServiceImpl(PostDAOInterface postDaoDbImpl) {
        this.postDaoDbImpl = postDaoDbImpl;
    }

    @Override
    public Post addPost(int loginUserId, Post post) {
        return postDaoDbImpl.addPost(post);
    }

    @Override
    public void updatePost(int loginUserId, Post post) {
        postDaoDbImpl.updatePost(post);
    }

    @Override
    public void deletePost(int loginUserId, int postId) {
        postDaoDbImpl.deletePost(postId); 
    }

    @Override
    public Post getPostById(int postId) {
        return postDaoDbImpl.getPostById(postId);
    }

    @Override
    public List<Post> getAllPosts() {
        return postDaoDbImpl.getAllPosts();

    }

    @Override
    public List<Post> getPostsByDate(Date date) {
        return postDaoDbImpl.getPostsByDate(date);
    }

    @Override
    public List<Post> getPostsByUser(int userId) {
       return postDaoDbImpl.getPostsByUser(userId);
    }

    @Override
    public List<Post> getPostsByCategory(int categoryId) {
        return postDaoDbImpl.getPostsByCategory(categoryId);
    }

    @Override
    public List<Post> getPostsByTag(int tagId) {
        return postDaoDbImpl.getPostsByTag(tagId);
    }

}
