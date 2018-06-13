package com.sg.blogcms.controller;

import com.sg.blogcms.dto.Category;
import com.sg.blogcms.dto.Notification;
import com.sg.blogcms.dto.Post;
import com.sg.blogcms.dto.Tag;
import com.sg.blogcms.dto.User;
import com.sg.blogcms.service.CategoryServiceInterface;
import com.sg.blogcms.service.MiscService;
import com.sg.blogcms.service.PostServiceInterface;
import com.sg.blogcms.service.TagServiceInterface;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sg.blogcms.service.UserServiceInterface;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import org.springframework.security.crypto.password.PasswordEncoder;

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
    MiscService miscService;
    PostServiceInterface postService;
    CategoryServiceInterface categoryService;
    TagServiceInterface tagService;
    PasswordEncoder encoder;

    @Inject
    public UserController(UserServiceInterface userService, MiscService miscService, PostServiceInterface postService, CategoryServiceInterface categoryService, TagServiceInterface tagService, PasswordEncoder encoder) {
        this.userService = userService;
        this.miscService = miscService;
        this.encoder = encoder;
        this.postService = postService;
        this.categoryService = categoryService;
        this.tagService = tagService;
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
    @RequestMapping(value = {"/userDashboard"}, method = RequestMethod.GET)
    public String loadUsers(HttpServletRequest request, Model model) {
        List<User> users = userService.getAllUsers();
        List<Notification> notifications = miscService.getUserNotifications("travzlife");
        List<Post> posts = postService.getPostsByUser(1);
        List<Category> categories = categoryService.getAllCategories();
        List<Tag> tags = tagService.getAllTags();

        model.addAttribute("view", request.getParameter("view"));
        model.addAttribute("users", users);
        model.addAttribute("notifications", notifications);
        model.addAttribute("tags", tags);
        model.addAttribute("posts", posts);
        model.addAttribute("categories", categories);
        return "users";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String createUser(HttpServletRequest request, Model model) {

        try {
            User user = new User();
            System.out.println(134 + " " + user);
            //Mo: For Hashing

            user.setUsername(request.getParameter("userName"));
            user.setEnabled(true); //Because the user should always be active
            
            //Mo: For Hashing
            user.setEmail(request.getParameter("userEmail"));
            String clearPw = request.getParameter("userPassword");
//            String hashPw = encoder.encode(clearPw);
            user.setUserPassword(clearPw);

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            java.sql.Date sqlDate =  new java.sql.Date(Calendar.getInstance().getTime().getTime());
            user.setLastActive(sqlDate);
            
            
            user.setUserAvatar(request.getParameter("userAvatar"));
//            user.setLastActive(request.getParameter("userDater"));
            // All users have ROLE_STANDARD, only add ROLE_ADMIN if the isAdmin box is checked
            user.addAuthority("ROLE_STANDARD");
            if (null != request.getParameter("isAdmin")) {
                user.addAuthority("ROLE_ADMIN");
            }
            User fromDb = userService.addUser(1, user); //Mo: Travz change this from static value
            
            
            Notification notify = new Notification();
            notify.setDate(sqlDate);
        
            notify.setNotificationBrief("Created a new user with his/her own unique properties");
            notify.setNotificationClass("create");
            notify.setNotificationType("user");
            notify.setUser("travzlife");
             
            
            miscService.addNotification(notify);
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return "redirect: userDashboard?view=users";
    }

    @RequestMapping(value = "/createUser", method = RequestMethod.GET)
    public String createUserForm(HttpServletRequest request, Model model) {
        return "createUser";
    }

    @RequestMapping(value = {"/deleteUser"}, method = RequestMethod.GET)
    public String deleteUser(HttpServletRequest request, Model model) {

        try {
            int userId = Integer.parseInt(request.getParameter("userID"));
            userService.deleteUser(1, userId);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return "redirect: viewUsers";
    }

    @RequestMapping(value = {"/selectUser"}, method = RequestMethod.GET)
    public String selectUser(HttpServletRequest request, Model model) {

        try {
            int userId = Integer.parseInt(request.getParameter("userID"));
            User user = userService.getUserById(userId);
            model.addAttribute("users", user);
            System.out.println(user);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return "redirect: viewUsers";
    }

}
