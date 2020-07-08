package com.dreamcapsule.project.apps.daliy.controller;

import com.dreamcapsule.project.apps.daliy.domain.DailyDomain;
import com.dreamcapsule.project.apps.daliy.service.DailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class DailyController {

    @Autowired
    DailyService dailyService;


    @RequestMapping("/daily")
    public ModelAndView daily(){

        List<DailyDomain> dailyList = dailyService.findByBno(1);
        ModelAndView nextPage = new ModelAndView("/board/commute/daily");
        nextPage.addObject("dailyList",dailyList);

        return nextPage;
    }

    @RequestMapping("/daily2")
    public String daily2(Model model){
        List<DailyDomain> daily = dailyService.findByBno(1);

        model.addAttribute("dailyList",daily);

        return "/board/commute/daily";
    }


}
