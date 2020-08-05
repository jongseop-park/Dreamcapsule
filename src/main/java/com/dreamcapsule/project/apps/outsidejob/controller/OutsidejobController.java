package com.dreamcapsule.project.apps.outsidejob.controller;

import com.dreamcapsule.project.apps.outsidejob.service.OutsidejobService;
import com.dreamcapsule.project.domain.HolidayVO;
import com.dreamcapsule.project.domain.OutsidejobVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class OutsidejobController {

    @Autowired
    OutsidejobService outsidejobService;

    @RequestMapping("/outside")
    public String home(Model model){
        List<OutsidejobVO> outsideJobList = outsidejobService.findAll();
        List<OutsidejobVO> outsideJobInfo = outsidejobService.findInfo();

        model.addAttribute("outsideJobList", outsideJobList);
        model.addAttribute("outsideJobInfo",outsideJobInfo);

        return "outsidejob/outsidejob_total";
    }
}
