/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.controller;

import com.sg.blogcms.dao.MiscDaoDbImpl;
import com.sg.blogcms.dto.Notification;
import com.sg.blogcms.service.UserServiceInterface;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author laptop
 */
@Controller
public class MiscController {
    UserServiceInterface userService;
    PasswordEncoder encoder;
    MiscDaoDbImpl dao = new MiscDaoDbImpl();

    @Inject
    public MiscController(UserServiceInterface userService, PasswordEncoder encoder) {
        this.userService = userService;
        this.encoder = encoder;
    }
    
    
    // Notifications
    @RequestMapping(value = {"/viewNotifications"}, method = RequestMethod.GET)
    public String viewNotifications(HttpServletRequest request, Model model) {
//        List<Notification> notification = dao.getAllNotifications(1); 
        return "notifications";
    }

    
}
