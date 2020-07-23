package com.dreamcapsule.project.apps.monthly.controller;


import com.dreamcapsule.project.apps.monthly.service.MonthlyService;
import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MonthlyController {


    @Autowired
    MonthlyService monthlyService;

    @RequestMapping(value = "/monthly", method = RequestMethod.GET)
    public String list(Model model , Criteria cri) throws Exception {

        model.addAttribute("monthlyday",monthlyService.mounthday());
        model.addAttribute("monthlyData",monthlyService.monthlyData(cri));

        model.addAttribute("lastdayNum",monthlyService.lastdayNum());
        model.addAttribute("dutyid",monthlyService.dutyFind());


        return "/commute/monthly";

    }
}
