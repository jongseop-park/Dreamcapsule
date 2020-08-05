package com.dreamcapsule.project.apps.management.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class EmployeeController { // 직원 관리

    @RequestMapping("/management/employee/list")
    public String list(){

        return "management/employee/list";
    }

    @RequestMapping("/management/employee/form")
    public String form(){

        return "management/employee/form";
    }
}
