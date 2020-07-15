package com.dreamcapsule.project.apps.management.equipment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EquipmentController { // 장비 관리

    @RequestMapping("/management/equipment/list")
    public String list(){

        return "management/equipment/list";
    }

    @RequestMapping("/management/equipment/form")
    public String form(){

        return "management/equipment/form";
    }
}
