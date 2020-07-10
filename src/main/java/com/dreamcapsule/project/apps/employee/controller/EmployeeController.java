package com.dreamcapsule.project.apps.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {

    @RequestMapping("/employee/list")
    public String list(){

        return "employee/list";
    }
}
