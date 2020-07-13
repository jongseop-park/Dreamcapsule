package com.dreamcapsule.project.apps.management.job.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JobController { // 직무 관리

    @RequestMapping("/management/job/list")
    public String list(){

        return "management/job/list";
    }

    @RequestMapping("/management/job/form")
    public String form(){

        return "management/job/form";
    }
}
