package com.dreamcapsule.project.apps.daily.controller;


import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.apps.daily.service.DailyService;
import com.dreamcapsule.project.domain.DailyDomain;
import com.dreamcapsule.project.domain.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        pageMaker.setTotalCount(dailyService.listCount(cri));

        model.addAttribute("pageMaker", pageMaker);
        return "/commute/daily";

    }
        @RequestMapping(value = "/dailyDetail", method = RequestMethod.GET)
        public String dailyDetail(Model model, Criteria cri) throws Exception{

                model.addAttribute("detail",dailyService.detailSearch(cri));

            return "commute/daily_detail";
        }

        @RequestMapping(value = "/detailUpdate", method = RequestMethod.POST)
        @ResponseBody
        public DailyDomain detailUpdate(@RequestBody DailyDomain dailyDomain) throws Exception{

            dailyService.detailUpdate(dailyDomain);

        return dailyDomain;
        }

        @GetMapping(path = "/download/dailyList", produces = "application/vnd.ms-excel")
        public String excelDownload(Model model) throws Exception{
            List<DailyDomain> dailylist=dailyService.dailyAllList();
            model.addAttribute("dailyXlsList",dailylist);
            return "dailyXls";
        }


}