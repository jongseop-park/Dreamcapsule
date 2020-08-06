package com.dreamcapsule.project.apps.admin.service;

import com.dreamcapsule.project.apps.admin.controller.AdminController;
import com.dreamcapsule.project.domain.AdminPrincipalVO;
import com.dreamcapsule.project.domain.AdminVO;
import com.dreamcapsule.project.apps.admin.mapper.AdminMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
public class AdminService implements UserDetailsService {
    private static final Logger log = LoggerFactory.getLogger(AdminService.class);
    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
        log.info("로드유저바이유저네임 유저 진입            "+userId );
        ArrayList<AdminVO> userAuthes = adminMapper.findByUserId(userId);
        if(userAuthes.size() == 0){
            throw new UsernameNotFoundException("User " +userId+"not Found!!!!");
        }
        return new AdminPrincipalVO(userAuthes);
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
    public String InsertUser(AdminVO adminVO){
        log.info("인설트 유저 진입");
        log.info(adminVO.getRoleName());
        adminVO.setUserPass(bCryptPasswordEncoder.encode(adminVO.getUserPass()));
        int flag = adminMapper.userSave(adminVO);
        if(flag>0){
            int userNo = adminMapper.findUserNo(adminVO.getUserId());
            int roleNo = adminMapper.findRoleNo(adminVO.getRoleName());
            log.info("됫음");
            adminMapper.userRoleSave(userNo,roleNo);

            return "success";
        }
        return "fail";
    }

    public void userSave(AdminVO adminVO){
        adminMapper.userSave(adminVO);

    }
}
