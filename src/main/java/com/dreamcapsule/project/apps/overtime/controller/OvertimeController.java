package com.dreamcapsule.project.apps.overtime.controller;


import com.dreamcapsule.project.apps.overtime.domain.Criteria;
import com.dreamcapsule.project.apps.overtime.domain.OvertimeDomain;
import com.dreamcapsule.project.apps.overtime.domain.OvertimeVO;
import com.dreamcapsule.project.apps.overtime.domain.PageMaker;
import com.dreamcapsule.project.apps.overtime.service.OvertimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class OvertimeController {

    @Autowired
    OvertimeService overtimeService;

/*
    @RequestMapping("/main")
    public String printHome() {
        return "/sampleView/home";
    }
*/


  /*  @RequestMapping("/overtimetemp")
    public ModelAndView overtime() throws Exception {
        List<OvertimeDomain> overtimeList = overtimeService.boardList();
        ModelAndView nextPage = new ModelAndView("overtimetemp");
        nextPage.addObject("overtimeList", overtimeList);

        return nextPage;
    }*/

  /*  @RequestMapping(value = "read.do", method = RequestMethod.GET)
    public String overtimet(@RequestParam int bno, Model model) throws Exception {
        List<OvertimeDomain> overtimeDomainList = overtimeService.findBno(bno);
        model.addAttribute("overtimeDomainList", overtimeDomainList);

        return "overtime/test";
    }*/

  /*  @RequestMapping(value = "/update.do" , method={RequestMethod.POST, RequestMethod.GET})
    public String modify(OvertimeDomain otd) throws Exception {
        overtimeService.updateInfo(otd);
        return "redirect:overtime";
    }*/

  /*  @RequestMapping("/overtimeAd")
    public String printList(Model model) throws Exception {
        List<OvertimeVO> overtimeVOList = overtimeService.empList();
        int listCount = overtimeService.listCount();

        model.addAttribute("empList", overtimeVOList);
        model.addAttribute("totalCount", listCount);

        return "overtime/empList";
    }*/

    @RequestMapping(value = "readInfo", method= RequestMethod.GET)
    public String printInfo(@RequestParam int sequence, Model model) throws Exception {
        OvertimeVO overtimeVO = overtimeService.findEmp(sequence);
        model.addAttribute("empInfo", overtimeVO);

        return "overtime/empInfo";
    }

    @RequestMapping(value="updateInfo", method=RequestMethod.POST)
    public String updateInfo(OvertimeVO overtimeVO) throws Exception {
        overtimeService.updateEmpInfo(overtimeVO);
        return "redirect:overtimeListPage";
    }

    @RequestMapping(value = "/overtimeListPage", method = RequestMethod.GET)
    public String listPage(Criteria cri, Model model) throws Exception {
        List<OvertimeVO> list = overtimeService.listPage(cri);
        model.addAttribute("list", list);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(overtimeService.listCount());
        model.addAttribute("pageMaker", pageMaker);

        return "overtime/overtimeListPage";
    }

}
