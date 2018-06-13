/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.service;


import com.sg.blogcms.dto.User;
import java.util.List;
import javax.inject.Inject;
import com.sg.blogcms.dao.UserDAOInterface;
import com.sg.blogcms.dto.Notification;

public class UserServiceImpl implements UserServiceInterface {

    private UserDAOInterface userDao;
    
    @Inject
    public UserServiceImpl(UserDAOInterface userDao) {
        this.userDao = userDao;
    }

    @Override
    public User addUser(int loginUserId, User user) throws Exception {
        if (true) {
            return userDao.addUser(user);
        } else {
            throw new Exception("User Add User, invalid credentials");
        }
    }

    @Override
    public void deleteUser(int loginUserId, int user) throws Exception {
        if (true) {
            userDao.deleteUser(user);
        } else {
            throw new Exception("User Delete User, invalid credentials");
        }
    }

    @Override
    public User updateUser(int loginUserId, User user) throws Exception {
        if (true) {
            return userDao.updateUser(user);
        } else {
            throw new Exception("User Update User, invalid credentials");
        }
    }

    @Override
    public User getUserById(int userId) {
        return userDao.getUserById(userId);
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    

}
