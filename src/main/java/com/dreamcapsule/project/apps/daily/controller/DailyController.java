package com.dreamcapsule.project.apps.daily.controller;


import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.DailyDomain;
import com.dreamcapsule.project.apps.daily.service.DailyService;
import com.dreamcapsule.project.domain.PageMaker;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller

public class DailyController {

//  private final static Logger LOG = LoggerFactory.getLogger(DailyController.class);


    @Autowired
    DailyService dailyService;


    @RequestMapping(value = "/daily", method = RequestMethod.GET)
    public String list(Model model, Criteria cri) throws Exception{

        model.addAttribute("daily", dailyService.listPage(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(dailyService.listCount());

        model.addAttribute("pageMaker", pageMaker);
        return "/commute/daily";

    }


//
//    @RequestMapping("/daily")
//    public ModelAndView readTest(){
//        List<DailyDomain> dailyList = dailyService.findAll();
//        ModelAndView nextPage = new ModelAndView("/commute/daily");
//        nextPage.addObject("dailyList",dailyList);
//
//       // Log.log(dailyList.get(0).getDutyId());
//        return nextPage;
//    }

}