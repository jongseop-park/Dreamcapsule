package com.dreamcapsule.project.apps.report.controller;



import com.dreamcapsule.project.apps.report.domain.PageMaker;
import com.dreamcapsule.project.apps.report.domain.SearchCriteria;
import com.dreamcapsule.project.apps.report.service.ReportService;
import com.dreamcapsule.project.domain.ReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class ReportController {
    @Autowired
    ReportService reportService;

    @RequestMapping(value= "/report", method = RequestMethod.GET)
    public String reportPrint(@ModelAttribute("scri") SearchCriteria scri,  Model model) throws Exception {
        List<ReportVO> reportVOList = reportService.listSearch(scri);
        model.addAttribute("reportVOList", reportVOList);
        model.addAttribute("scri", scri);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(scri);
        pageMaker.setTotalCount(reportService.countSearch(scri));
        model.addAttribute("pageMaker", pageMaker);

        return "report/list";
    }

    @GetMapping(path="/download/report" , produces = "application/vnd.ms-excel")
    public String downloadExcel(Model model, SearchCriteria searchCriteria) throws Exception {
        List<ReportVO> reportVOList =  reportService.reportExcel(searchCriteria);
       model.addAttribute("reportVOList" ,reportVOList);

        return "reportXls";
    }
}
