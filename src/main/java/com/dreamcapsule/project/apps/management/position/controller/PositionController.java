package com.dreamcapsule.project.apps.management.position.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PositionController { // 직급 관리

    @RequestMapping("/management/position/list")
    public String list(){

        return "management/position/list";
    }

    @RequestMapping("/management/position/form")
    public String form(){

        return "management/position/form";
    }
}
