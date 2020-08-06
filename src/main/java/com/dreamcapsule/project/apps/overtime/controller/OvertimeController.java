package com.dreamcapsule.project.apps.overtime.controller;


import com.dreamcapsule.project.apps.overtime.domain.*;
import com.dreamcapsule.project.apps.overtime.service.OvertimeService;
import com.dreamcapsule.project.apps.overtime.view.MakeExcel;
import com.dreamcapsule.project.domain.OvertimeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;


// 야근관리
@Controller
@RequestMapping("/admin")
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

    // poi
    @GetMapping(path="/download/overtime", produces="application/vnd.ms-excel")
    public String downloadExcel(Model model, SearchCriteria searchCriteria) throws Exception {
        List<OvertimeVO> overtimeVOList = overtimeService.overtimeExcel(searchCriteria);
        model.addAttribute("overtimeVOList", overtimeVOList);

        return "overtimeXls";
    }

    // jxls
    @RequestMapping(value= "/overtimeExcel")
    public void listExcel(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<OvertimeVO> dataList = overtimeService.overtimeList();

        Map<String, Object> beans = new HashMap<>();
        beans.put("dataList", dataList);

        MakeExcel me = new MakeExcel();
        me.download(request, response, beans, "overtime", "overtimetemplate.xls", "");
    }
}
