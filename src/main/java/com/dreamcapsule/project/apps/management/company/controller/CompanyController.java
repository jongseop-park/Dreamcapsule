package com.dreamcapsule.project.apps.management.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyController { // 업체 관리

    @RequestMapping("/management/company/list")
    public String list(){

        return "management/company/list";
    }

    @RequestMapping("/management/company/form")
    public String form(){

        return "management/company/form";
    }
}
