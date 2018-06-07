/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.service;

import com.sg.blogcms.dao.UserDao;
import com.sg.blogcms.dto.User;
import java.util.List;
import javax.inject.Inject;

public class UserServiceImpl implements UsersService {

    private UserDao dao;
    
    @Inject
    public UserServiceImpl(UserDao dao) {
        this.dao = dao;
    }

    @Override
    public User addUser(int loginUserId, User user) throws Exception {
        if (true) {
            return dao.addUser(user);
        } else {
            throw new Exception("User Add User, invalid credentials");
        }
    }

    @Override
    public void deleteUser(int loginUserId, int user) throws Exception {
        if (true) {
            dao.deleteUser(user);
        } else {
            throw new Exception("User Delete User, invalid credentials");
        }
    }

    @Override
    public User updateUser(int loginUserId, User user) throws Exception {
        if (true) {
            return dao.updateUser(user);
        } else {
            throw new Exception("User Update User, invalid credentials");
        }
    }

    @Override
    public User getUserById(int userId) {
        return dao.getUserById(userId);
    }

    @Override
    public List<User> getAllUsers() {
        return dao.getAllUsers();
    }

}
