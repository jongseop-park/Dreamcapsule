package com.dreamcapsule.project.apps.management.annual.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AnnualController { // 연차 관리

    @RequestMapping("/management/annual/list")
    public String list(){

        return "management/annual/list";
    }

    @RequestMapping("/management/annual/form")
    public String form(){

        return "management/annual/form";
    }
}
