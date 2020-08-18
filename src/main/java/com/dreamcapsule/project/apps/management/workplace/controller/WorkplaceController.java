package com.dreamcapsule.project.apps.management.workplace.controller;

import com.dreamcapsule.project.apps.management.workplace.service.WorkplaceService;
import com.dreamcapsule.project.domain.EquipmentVO;
import com.dreamcapsule.project.domain.PageMaker;
import com.dreamcapsule.project.domain.UseEquipmentVO;
import com.dreamcapsule.project.domain.WorkplaceVO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/admin/management/workplace")
@Controller
public class WorkplaceController { // 근무지 관리

    private final static Logger log = LoggerFactory.getLogger(WorkplaceController.class);

    @Autowired
    public WorkplaceService workplaceService;

    @RequestMapping("/list")
    public String list(WorkplaceVO conn, Model model){
        List<WorkplaceVO> result = workplaceService.page(conn);
        model.addAttribute("result", result);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(conn);
        pageMaker.setTotalCount(workplaceService.listCnt());
        model.addAttribute("pageMaker",pageMaker);

        log.info("==================================================================");
        log.info("management/workplace/list");
        log.info("==================================================================");

        return "management/workplace/list";
    }

    @RequestMapping("/form")
    public String form(@ModelAttribute("conn") WorkplaceVO conn, Model model){

        EquipmentVO equipmentVO = new EquipmentVO();
        model.addAttribute("beaconList",workplaceService.beaconList());
        model.addAttribute("nfcList",workplaceService.nfcList());

        if(StringUtils.isNotEmpty(conn.getSeq())){
            model.addAttribute("result",workplaceService.findByDetail(conn));
            model.addAttribute("isUpdate",true);
        }else { // 저장
            model.addAttribute("isUpdate",false);
        }

        log.info("==================================================================");
        log.info("management/workplace/form");
        log.info("==================================================================");

        return "management/workplace/form";
    }

    @RequestMapping("/save")
    @ResponseBody
    public WorkplaceVO save(@RequestBody WorkplaceVO conn){
        if(StringUtils.isEmpty(conn.getSeq())){
//            workplaceService.insert(conn);
            log.info("WorkplaceVO : "+conn);
            log.info("==================================================================");
            log.info("management/workplace/save");
            log.info("insert");
            log.info("==================================================================");

        }
        else {
//            workplaceService.update(conn);
            log.info("==================================================================");
            log.info("management/workplace/save");
            log.info("update");
            log.info("==================================================================");
        }
        return conn;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public WorkplaceVO delete(@RequestBody WorkplaceVO conn){

        return conn;
    }
}
