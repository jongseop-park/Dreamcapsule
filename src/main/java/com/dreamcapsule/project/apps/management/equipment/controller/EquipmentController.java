package com.dreamcapsule.project.apps.management.equipment.controller;

import com.dreamcapsule.project.apps.management.equipment.service.EquipmentService;
import com.dreamcapsule.project.domain.EquipmentVO;
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

@RequestMapping("/admin/management/equipment")
@Controller
public class EquipmentController { // 장비 관리

    private static final Logger log = LoggerFactory.getLogger(EquipmentController.class);

    @Autowired
    public EquipmentService equipmentService;

    @RequestMapping("/list")
    public String list(EquipmentVO conn, Model model){
        List<EquipmentVO> result = equipmentService.page(conn);
        model.addAttribute("result",result);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(conn);
        pageMaker.setTotalCount(equipmentService.listCnt());
        model.addAttribute("pageMaker",pageMaker);

        log.info("==================================================================");
        log.info("management/equipment/list");
        log.info("==================================================================");

        return "management/equipment/list";
    }

    @RequestMapping("/form")
    public String form(EquipmentVO conn, Model model){

        if(StringUtils.isNotEmpty(conn.getSeq())){ // 게시글 체크
            model.addAttribute("result",equipmentService.findByDetail(conn));
            model.addAttribute("isUpdate",true);
        } else {
            model.addAttribute("isUpdate",false);
        }

        log.info("==================================================================");
        log.info("management/equipment/form");
        log.info("==================================================================");

        return "management/equipment/form";
    }

    @RequestMapping("/save")
    @ResponseBody
    public EquipmentVO save(@RequestBody EquipmentVO conn){

        if(StringUtils.isEmpty(conn.getSeq())){
            equipmentService.insert(conn);
            log.info("==================================================================");
            log.info("management/equipment/save");
            log.info("insert");
            log.info("==================================================================");
        } else {
            equipmentService.update(conn);
            log.info("==================================================================");
            log.info("management/equipment/save");
            log.info("update");
            log.info("==================================================================");
        }

        return conn;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public EquipmentVO delete(@RequestBody EquipmentVO conn){

        equipmentService.delUpdate(conn);
        log.info("==================================================================");
        log.info("management/equipment/delete");
        log.info("==================================================================");
        return conn;
    }
}
