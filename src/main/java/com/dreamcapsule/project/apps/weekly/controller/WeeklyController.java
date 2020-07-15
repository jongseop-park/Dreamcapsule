package com.dreamcapsule.project.apps.weekly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class WeeklyController {


        @RequestMapping({"/weekly"})
        public String dailyDetail(){

            return "commute/weekly";
        }
    }


