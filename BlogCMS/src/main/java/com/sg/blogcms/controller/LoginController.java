package com.sg.blogcms.controller;

import com.sg.blogcms.dto.User;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sg.blogcms.service.UserServiceInterface;

/**
 *
 * @author travz
 */
@Controller
public class LoginController {

    UserServiceInterface userService;

    @Inject
    public LoginController(UserServiceInterface userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginForm() {
        return "login";
    }
}
