package com.dreamcapsule.project.apps.overtime.controller;


import com.dreamcapsule.project.apps.overtime.domain.*;
import com.dreamcapsule.project.apps.overtime.service.OvertimeService;
import com.dreamcapsule.project.domain.OvertimeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;


// 야근관리
@Controller
public class OvertimeController {

    @Autowired
    OvertimeService overtimeService;

    @RequestMapping(value = "readInfo", method= RequestMethod.GET)
    public String printInfo(@RequestParam int sequence, Model model,
                            @ModelAttribute("scri") SearchCriteria scri) throws Exception {
        OvertimeVO overtimeVO = overtimeService.findEmp(sequence);
        model.addAttribute("empInfo", overtimeVO);
        model.addAttribute("scri", scri);

        return "overtime/info";
    }

    @RequestMapping(value="updateInfo", method=RequestMethod.POST)
    public String updateInfo(OvertimeVO overtimeVO, @ModelAttribute("scri") SearchCriteria scri
            , RedirectAttributes rttr) throws Exception {
        overtimeService.updateEmpInfo(overtimeVO);

        rttr.addAttribute("page", scri.getPage());
        rttr.addAttribute("keyword", scri.getKeyword());
        rttr.addAttribute("startDate", scri.getStartDate());
        rttr.addAttribute("endDate", scri.getEndDate());

        return "redirect:overtime";
    }

    @RequestMapping(value= "/overtime" , method = RequestMethod.GET)
    public String listSearch(@ModelAttribute("scri")SearchCriteria scri, Model model) throws Exception {
        List<OvertimeVO> searchList = overtimeService.listSearch(scri);
        model.addAttribute("searchList", searchList);
        model.addAttribute("scri", scri);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(scri);
        pageMaker.setTotalCount(overtimeService.countSearch(scri));
        model.addAttribute("pageMaker", pageMaker);

        return "overtime/list";
    }

    @RequestMapping("/update")
    @ResponseBody
    public OvertimeVO update(@RequestBody OvertimeVO conn) throws Exception {
        overtimeService.updateEmpInfo(conn);
        return conn;
    }

    @GetMapping(path="/download/overtime", produces="application/vnd.ms-excel")
    public String downloadExcel(Model model) throws Exception {
        List<OvertimeVO> overtimeVOList = overtimeService.overtimeList();
        model.addAttribute("overtimeVOList", overtimeVOList);

        return "overtimeXls";
    }
}
