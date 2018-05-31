/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sg.blogcms.controller;


import com.sg.blogcms.dto.User;
import com.sg.blogcms.service.UserService;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author travz
 */
@Controller
public class UserController {

    UserService userService;

    @Inject
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = {"/viewUsers"}, method = RequestMethod.GET)
    public String loadUsers(HttpServletRequest request, Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users";
    }

    @RequestMapping(value = {"/createUser"}, method = RequestMethod.POST)
    public String createUser(HttpServletRequest request, Model model) {
        User user = new User();

        user.setEmail(request.getParameter("userEmail"));
        user.setUsername(request.getParameter("userName"));
        user.setUserAvatar(request.getParameter("userAvatar"));
        user.setUserId(Integer.parseInt(request.getParameter("userId")));
        user.setUserPassword(request.getParameter("userPassword"));
        user.setUserType(Integer.parseInt(request.getParameter("userId")));

        try {
            userService.addUser(1, user);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return "redirect: viewUsers";
    }
}
