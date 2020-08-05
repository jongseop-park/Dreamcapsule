package com.dreamcapsule.project.apps.admin.controller;

import com.dreamcapsule.project.apps.admin.service.AdminService;
import com.dreamcapsule.project.domain.AdminPrincipalVO;
import com.dreamcapsule.project.domain.AdminVO;
import com.dreamcapsule.project.domain.OvertimeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdminController {



    @Autowired
    private AdminService adminService;


    private static final Logger log = LoggerFactory.getLogger(AdminController.class);
    @Autowired
    PasswordEncoder passwordEncoder;

    @GetMapping("/login")
    public String login() {

        return "/admin/login";
    }




//    @RequestMapping("/update")
//    @ResponseBody
//    public OvertimeVO update(@RequestBody OvertimeVO conn) throws Exception {
//        overtimeService.updateEmpInfo(conn);
//        return conn;
//    }
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String join(AdminVO adminVO,
       @RequestParam(value = "userId") String userId,@RequestParam(value = "userName") String userName,
                       @RequestParam(value = "userPass") String userPass
    ) throws Exception{
//        AdminPrincipalVO adminprin = new AdminPrincipalVO();

        adminVO.setUserName(userName);
        adminVO.setUserId(userId);
        adminVO.setUserPass(userPass);
        adminVO.setRoleName("ROLE_USER");

        adminService.InsertUser(adminVO);

        return "redirect:login";
    }


    @GetMapping("/register")
    public String joinPage1() throws Exception{

        return "/admin/register";
    }

    @GetMapping("/admin/main")
    public String loadExceptionPage(ModelMap model) throws Exception{

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        AdminPrincipalVO adminPrincipalVO = (AdminPrincipalVO) auth.getPrincipal();

        model.addAttribute("name",adminPrincipalVO.getUsername());
        model.addAttribute("auth",adminPrincipalVO.getAuthorities());

        return "/main/main";

    }

    @GetMapping("/error403")
    public String loadAccessdeniedPage() throws Exception{
        return "/error/403";
    }

}
