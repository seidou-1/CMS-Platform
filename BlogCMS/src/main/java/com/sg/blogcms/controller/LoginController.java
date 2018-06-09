package com.sg.blogcms.controller;

import com.sg.blogcms.dto.User;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sg.blogcms.service.UsersService;

/**
 *
 * @author travz
 */
@Controller
public class LoginController {

    UsersService userService;

    @Inject
    public LoginController(UsersService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginForm() {
        return "users";
    }
}
