package com.dreamcapsule.project.apps.management.employee.controller;

import com.dreamcapsule.project.apps.admin.controller.AdminController;
import com.dreamcapsule.project.apps.management.employee.service.EmployeeService;
import com.dreamcapsule.project.domain.EmployeeVO;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class EmployeeController { // 직원 관리
    private static final Logger log = LoggerFactory.getLogger(EmployeeController.class);
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/management/employee/list")
    public String list(Model model){
        model.addAttribute("emplist",employeeService.emplList());
        return "management/employee/list";
    }

    @RequestMapping("/management/employee/form")
    public String form(Model model,EmployeeVO employeeVO ){
        if(employeeVO.getEmpSeq()==0){
            model.addAttribute("pagecheck",false);
            log.info("================직원추가 진입================");
        }else{
            model.addAttribute("pagecheck",true);
            log.info("================직원관리 진입================");
            model.addAttribute("infolist",employeeService.infolist(employeeVO));
        }
        model.addAttribute("dutylist",employeeService.dutylist());
        model.addAttribute("ranklist",employeeService.ranklist());
        model.addAttribute("placelist",employeeService.placelist());
        model.addAttribute("authlist",employeeService.authlist());

        return "management/employee/form";
    }
    @RequestMapping(value = "/management/employee/save", method = RequestMethod.POST)
    @ResponseBody
    public EmployeeVO update(@RequestBody EmployeeVO employeeVO){
        employeeService.empUpdate(employeeVO);
        return employeeVO;
    }

    @RequestMapping(value = "/management/employee/infoUpdate",method = RequestMethod.POST)
    @ResponseBody
    public EmployeeVO infoUpdate(@RequestBody EmployeeVO employeeVO
                              ){

        employeeService.infoUpdate(employeeVO);
        return employeeVO;
    }
    @RequestMapping(value = "/management/employee/infoDelete",method = RequestMethod.POST)
    @ResponseBody
    public EmployeeVO infoDelete(@RequestBody EmployeeVO employeeVO
    ){

        employeeService.infoDelete(employeeVO);
        return employeeVO;
    }

}