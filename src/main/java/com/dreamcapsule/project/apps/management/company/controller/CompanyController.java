package com.dreamcapsule.project.apps.management.company.controller;

import com.dreamcapsule.project.apps.management.company.service.CompanyService;
import com.dreamcapsule.project.domain.CompanyVO;
import com.dreamcapsule.project.domain.PageMaker;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/management/company")
public class CompanyController { // 업체 관리

    private static final Logger log = LoggerFactory.getLogger(CompanyController.class);

    @Autowired
    public CompanyService companyService;

    @RequestMapping("/list")
    public String list(CompanyVO conn, Model model){
        List<CompanyVO> result = companyService.page(conn);
        model.addAttribute("result",result);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(conn);
        pageMaker.setTotalCount(companyService.listCnt());
        model.addAttribute("pageMaker",pageMaker);

        log.info("==================================================================");
        log.info("management/company/list");
        log.info("==================================================================");
        return "management/company/list";
    }

    @RequestMapping("/form")
    public String form(CompanyVO conn, Model model){

        if(StringUtils.isNotEmpty(conn.getSeq())){ // 게시글 체크
            model.addAttribute("result",companyService.findByDetail(conn));
            model.addAttribute("isUpdate",true);
        } else {
            model.addAttribute("isUpdate",false);
        }

        log.info("==================================================================");
        log.info("management/company/form");
        log.info("==================================================================");
       return "management/company/form";
    }

    @RequestMapping("/save")
    @ResponseBody
    public CompanyVO save(@RequestBody CompanyVO conn){

        if(StringUtils.isEmpty(conn.getSeq())){
            companyService.insert(conn);
            log.info("==================================================================");
            log.info("management/company/save");
            log.info("management/company/insert");
            log.info("==================================================================");

        } else {
            companyService.update(conn);
            log.info("==================================================================");
            log.info("management/company/save");
            log.info("management/company/update");
            log.info("==================================================================");
        }
        return conn;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public CompanyVO delete(@RequestBody CompanyVO conn){

        companyService.delUpdate(conn);

        log.info("==================================================================");
        log.info("management/company/delete");
        log.info("==================================================================");

        return conn;
    }
}
