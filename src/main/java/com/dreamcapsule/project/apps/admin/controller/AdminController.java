package com.dreamcapsule.project.apps.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    private static final Logger log = LoggerFactory.getLogger(AdminController.class);

    @RequestMapping("/login")
    public String login(){

        return "admin/login";
    }

/*    @RequestMapping("/home")
    public String loginSuccess(){

        log.debug("홈");

        return "home/home";
    }*/

    @RequestMapping("/register")
    public String register(){

        return "admin/register";
    }

    @RequestMapping("/forgot-password")
    public String forgotPassword(){

        return "admin/forgot-password";
    }
}
