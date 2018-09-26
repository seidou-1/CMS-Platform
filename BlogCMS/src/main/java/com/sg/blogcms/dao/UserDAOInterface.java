/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dao;

import com.sg.blogcms.dto.Notification;
import com.sg.blogcms.dto.User;
import java.util.List;

/**
 *
 * @author laptop
 */

// Changed from UserDaoInterface to UserDao
public interface UserDAOInterface {

    public User addUser(User user);

    public void deleteUser(int userId);

    public User updateUser(User user);

    public User getUserById(int userId);
    
    public List <User> getAllUsers();

    public User getUserByUsername(String username);

}
