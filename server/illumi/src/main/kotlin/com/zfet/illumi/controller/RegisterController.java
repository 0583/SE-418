package com.zfet.illumi.controller;

import com.zfet.illumi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
public class RegisterController{

    @Autowired
    private UserService userService;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @RequestMapping("/register")
    public String register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String confirmPassword=request.getParameter("confirmPassword");
        String mes=userService.register(username, password, confirmPassword);
        if(mes.equals("Register Successfully!")){
            redirectStrategy.sendRedirect(request, response, "/login.html");
        }
        return mes;
    }

}
