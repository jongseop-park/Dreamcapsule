package com.dreamcapsule.project.apps.home.controller;


import lombok.extern.slf4j.Slf4j;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.logging.Logger;

@Controller
public class HomeController {

    @RequestMapping({"/home"})
    public String home(){

        return "home/home";
    }


}
