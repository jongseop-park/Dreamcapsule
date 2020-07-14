package com.dreamcapsule.project.apps.holiday.controller;

import com.dreamcapsule.project.apps.holiday.service.HolidayService;
import com.dreamcapsule.project.apps.holiday.service.serviceImpl.HolidayServiceImpl;
import com.dreamcapsule.project.domain.HolidayVO;
import com.dreamcapsule.project.domain.SampleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class HolidayController {

    @Autowired
    HolidayService holidayService;

    @RequestMapping("/holiday")
    public String home(Model model) {
        List<HolidayVO> holidayList = holidayService.findAll();
        model.addAttribute("holidayList", holidayList);
        return "holiday/holiday_total";
    }

    @RequestMapping("/holiday_details")
    public String sub(Model model) {
        List<HolidayVO> holidayDetails = holidayService.findByName("최병현");
        model.addAttribute("holidayDetails", holidayDetails);
        return "holiday/holiday_details";
    }

    @RequestMapping("/holiday_add")
    public String add(Model model) {

        List<HolidayVO> holidayDetails = holidayService.findBySEQ(1);
        model.addAttribute("holidayDetails", holidayDetails);
        return "holiday/holiday_add";
    }
}
