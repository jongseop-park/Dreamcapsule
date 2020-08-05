package com.dreamcapsule.project.apps.management.workplace.controller;

import com.dreamcapsule.project.apps.management.workplace.service.WorkplaceService;
import com.dreamcapsule.project.domain.WorkplaceVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/admin/management/workplace")
@Controller
public class WorkplaceController { // 근무지 관리

    private final static Logger log = LoggerFactory.getLogger(WorkplaceController.class);

    @Autowired
    public WorkplaceService workplaceService;

    @RequestMapping("/list")
    public String list(){

        return "management/workplace/list";
    }

    @RequestMapping("/form")
    public String form(){

        return "management/workplace/form";
    }

    @RequestMapping("/save")
    @ResponseBody
    public WorkplaceVO save(@RequestBody WorkplaceVO conn){

        return conn;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public WorkplaceVO delete(@RequestBody WorkplaceVO conn){

        return conn;
    }
}
