package com.dreamcapsule.project.apps.monthly.controller;


import com.dreamcapsule.project.apps.monthly.service.MonthlyService;
import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.MonthlyVO;
import com.dreamcapsule.project.domain.PageMaker;
import com.dreamcapsule.project.domain.WeeklyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class MonthlyController {


    @Autowired
    MonthlyService monthlyService;

    @RequestMapping(value = "/monthly", method = RequestMethod.GET)
    public String list(Model model ,
                       @ModelAttribute("cri") Criteria cri) throws Exception {

        model.addAttribute("monthlyday",monthlyService.mounthday(cri));
        model.addAttribute("monthlyData",monthlyService.monthlyData(cri));

        model.addAttribute("lastdayNum",monthlyService.lastdayNum(cri));
        model.addAttribute("dutynm",monthlyService.dutyFind());


        return "commute/monthly";

    }



}
