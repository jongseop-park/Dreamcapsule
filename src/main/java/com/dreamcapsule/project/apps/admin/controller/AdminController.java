package com.dreamcapsule.project.apps.admin.controller;

import com.dreamcapsule.project.apps.admin.service.CustomUserDetailsService;
import com.dreamcapsule.project.domain.AdminVO;
import com.dreamcapsule.project.domain.AuthorityVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

    private static final Logger log = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    CustomUserDetailsService customUserDetailsService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @RequestMapping("/login")
    public String login(){

        return "admin/login";
    }

/*    @RequestMapping("/home")
    public String loginSuccess(){

        log.debug("홈");

        return "home/home";
    }*/

    /* 회원가입 페이지 */
    @RequestMapping("/register")
    public String register(AdminVO adminVO){

        return "admin/register";
    }

    /* 회원가입 */
    @RequestMapping("/save")
    @ResponseBody
    public String save(@RequestBody AdminVO adminVO){
        log.info(""+adminVO);
        AuthorityVO authorityVO = new AuthorityVO();

        adminVO.setAdminPw(passwordEncoder.encode(adminVO.getAdminPw()));
        authorityVO.setUsername(adminVO.getUsername());
        authorityVO.setAuthorityNm("ROLE_ADMIN");

        customUserDetailsService.save(adminVO);
        /*customUserDetailsService.saveRole();*/

        return "redirect:/login";
    }

    @RequestMapping("/forgot-password")
    public String forgotPassword(){

        return "admin/forgot-password";
    }

    @RequestMapping("/error403")
    public String error403(){

        return "error/403";
    }
}
