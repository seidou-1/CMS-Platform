package com.sg.blogcms.controller;

import java.text.MessageFormat;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sg.blogcms.service.UserServiceInterface;

/**
 *
 * @author travz
 */
@Controller
public class ErrorController {

    UserServiceInterface userService;

    @Inject
    public ErrorController(UserServiceInterface userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/error")
    public String customError(HttpServletRequest request,
            HttpServletResponse response,
            Model model) {
        // retrieve some useful information from the request
        Integer statusCode
                = (Integer) request.getAttribute("javax.servlet.error.status_code");
        HttpStatus httpStatus = HttpStatus.valueOf(statusCode);
        Throwable throwable
                = (Throwable) request.getAttribute("javax.servlet.error.exception");
        String exceptionMessage = null;
        exceptionMessage = httpStatus.getReasonPhrase();

        String requestUri
                = (String) request.getAttribute("javax.servlet.error.request_uri");
        if (requestUri == null) {
            requestUri = "Unknown";
        }
        // format the message for the view
        String message = MessageFormat.format("{0} returned for {1}: {2}",
                statusCode, requestUri, exceptionMessage);

        model.addAttribute("errorMessage", message);
        return "customError";
    }

}
