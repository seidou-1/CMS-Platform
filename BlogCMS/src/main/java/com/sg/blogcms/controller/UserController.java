package com.sg.blogcms.controller;

import com.sg.blogcms.dto.User;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sg.blogcms.service.UserServiceInterface;
import java.util.Map;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author travz
 */
@Controller
public class UserController {
    
    /*
    Mo: This UserController hashes the password for new Users before storing the values in the database.
    */

    UserServiceInterface userService;
    PasswordEncoder encoder;

    @Inject
    public UserController(UserServiceInterface userService, PasswordEncoder encoder) {
        this.userService = userService;
        this.encoder = encoder;
    }
    
    /*
    MO: Commented these below endpoints. Chat with Travz to figure out which JSPs need to be created
    
    //  This endpoint retrieves all users from the database and puts the List of users on the model
    @RequestMapping(value = "/displayUserList", method = RequestMethod.GET)
    public String displayUserList(Map<String, Object> model) {
        List users = dao.getAllUsers();
        model.put("users", users);
        return "displayUserList";
    }
    
    // This endpoint just displays the Add User form
    @RequestMapping(value = "/displayUserForm", method = RequestMethod.GET)
    public String displayUserForm(Map<String, Object> model) {
        return "addUserForm";
    }
    */

    @RequestMapping(value = {"/viewUsers"}, method = RequestMethod.GET)
    /*
    Mo: Travz to update this later from retrieving a single static value to retrieving all users dynamically
    */
    public String loadUsers(HttpServletRequest request, Model model) {
        User user = userService.getUserById(1);
        model.addAttribute("users", user);
        return "user";
    }

    @RequestMapping(value = {"/createUser"}, method = RequestMethod.POST)
    public String createUser(HttpServletRequest request, Model model) {

        try {
            User user = new User();

            user.setEmail(request.getParameter("userEmail"));
            user.setUserAvatar(request.getParameter("userAvatar"));
            user.setUsername(request.getParameter("userName"));
            user.setUserType(Integer.parseInt(request.getParameter("userType")));
            
            //Mo: For Hashing
            String clearPw = request.getParameter("userPassword");
            String hashPw = encoder.encode(clearPw);

            // All users have ROLE_STANDARD, only add ROLE_ADMIN if the isAdmin box is checked
            user.addAuthority("ROLE_STANDARD");
            if (null != request.getParameter("isAdmin")) {
                user.addAuthority("ROLE_ADMIN");
            }

            userService.addUser(1, user); //Mo: Travz change this from static value
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return "redirect: viewUsers";
    }
    
   @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    public String deletUser(@RequestParam("username") int userID, Map<String, Object> model) throws Exception { //Should this be an int or a String?
        userService.deleteUser(1, 1); //Mo: Travz to change this later from 1 to LoginUserID
        return "redirect:displayUserList";
    }
    
}
