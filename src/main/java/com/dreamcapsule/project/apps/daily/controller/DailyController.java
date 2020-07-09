package com.dreamcapsule.project.apps.daily.controller;


import com.dreamcapsule.project.domain.DailyDomain;
import com.dreamcapsule.project.apps.daily.service.DailyService;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springsource.loaded.Log;

import java.util.List;

@Controller

public class DailyController {

//    private final static Logger LOG = LoggerFactory.getLogger(DailyController.class);

    @Autowired
    DailyService dailyService;

    @RequestMapping("/daily")
    public ModelAndView readTest(){
        List<DailyDomain> dailyList = dailyService.findAll();
        ModelAndView nextPage = new ModelAndView("/commute/daily");
        nextPage.addObject("dailyList",dailyList);

       // Log.log(dailyList.get(0).getDutyId());
        return nextPage;
    }

}