package com.dreamcapsule.project.apps.daily.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DailyDetailController {
    @RequestMapping({"/dailyDetail"})
    public String dailyDetail(){

        return "commute/daily_detail";
    }
}
