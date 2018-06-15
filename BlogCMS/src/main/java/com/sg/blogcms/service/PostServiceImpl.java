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

    PostDAOInterface postDao;

    @Inject
    public PostServiceImpl(PostDAOInterface postDao) {
        this.postDao = postDao;
    }

    @Override
    public Post addPost(int loginUserId, Post post) {
        return postDao.addPost(post);
    }

    @Override
    public void updatePost(int loginUserId, Post post) {
        postDao.updatePost(post);
    }

    @Override
    public void deletePost(int loginUserId, int postId) {
        postDao.deletePost(postId); 
    }

    @Override
    public Post getPostById(int postId) {
        return postDao.getPostById(postId);
    }

    @Override
    public List<Post> getAllPosts() {
        return postDao.getAllPosts();

    }

    @Override
    public List<Post> getPostsByDate(Date date) {
        return postDao.getPostsByDate(date);
    }

    @Override
    public List<Post> getPostsByUser(int userId) {
       return postDao.getAllPosts();
    }

    @Override
    public List<Post> getPostsByCategory(int categoryId) {
        return postDao.getPostsByCategory(categoryId);
    }

    @Override
    public List<Post> getPostsByTag(int tagId) {
        return postDao.getPostsByTag(tagId);
    }

}
