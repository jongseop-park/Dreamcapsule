package com.dreamcapsule.project.apps.management.workplace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkplaceController { // 근무지 관리

    @RequestMapping("/management/workplace/list")
    public String list(){

        return "management/workplace/list";
    }

    @RequestMapping("/management/workplace/form")
    public String form(){

        return "management/workplace/form";
    }
}
