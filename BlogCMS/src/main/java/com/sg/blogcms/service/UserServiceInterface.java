/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.service;

import com.sg.blogcms.dto.User;
import java.util.List;

/**
 *
 * @author laptop
 */
public interface UserServiceInterface {
//loginUserId is the actual user logged in and userId is the person you want to perform the action on
    public User addUser(int loginUserId, User user)  throws Exception;

    public void deleteUser(int loginUserId, int user) throws Exception; 

    public User updateUser(int loginUserId, User user) throws Exception;

    public User getUserById(int userId);

    public List<User> getAllUsers();
    
}
