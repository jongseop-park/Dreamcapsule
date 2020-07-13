package com.dreamcapsule.project.apps.management.opinion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OpinionController { // 의견 관리

    @RequestMapping("/management/opinion/list")
    public String list(){

        return "management/opinion/list";
    }

    @RequestMapping("/management/opinion/form")
    public String form(){

        return "management/opinion/form";
    }
}
