package com.dreamcapsule.project.apps.weekly.controller;

import com.dreamcapsule.project.apps.daily.service.DailyService;
import com.dreamcapsule.project.apps.weekly.service.WeeklyService;
import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.DailyDomain;
import com.dreamcapsule.project.domain.PageMaker;
import com.dreamcapsule.project.domain.WeeklyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class WeeklyController {


//        @RequestMapping({"/weekly"})
//        public String dailyDetail(){
//
//            return "commute/weekly";
//        }

    @Autowired
    WeeklyService weeklyService;

    @RequestMapping(value = "/weekly", method = RequestMethod.GET)
    public String list(Model model, Criteria cri) throws Exception{

        model.addAttribute("weekly", weeklyService.nameSelect(cri));
//        model.addAttribute("calName", weeklyService.calNameFind(cri));
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(weeklyService.listCount(cri));

        model.addAttribute("pageMaker", pageMaker);
        return "/commute/weekly";

    }

    @GetMapping(path = "/download/weeklydown", produces = "application/vnd.ms-excel")
    public String excelDownload(Model model, Criteria cri) throws Exception{
        List<WeeklyVO> weeklyXls=weeklyService.weeklyXlsDown(cri);
        model.addAttribute("weeklyXls",weeklyXls);
        return "WeeklyXls";
    }


}

