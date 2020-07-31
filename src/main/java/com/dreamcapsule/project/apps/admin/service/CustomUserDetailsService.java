package com.dreamcapsule.project.apps.admin.service;

import com.dreamcapsule.project.apps.admin.mapper.AdminMapper;
import com.dreamcapsule.project.domain.AdminVO;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    public AdminMapper adminMapper;

    private static final Logger log = LoggerFactory.getLogger(CustomUserDetailsService.class);

    @Override
    public UserDetails loadUserByUsername(String username) {
        AdminVO admin = adminMapper.findById(username);
        if(admin != null){
            return admin;
        } else {
            log.info("####### 계정이 존재하지 않습니다. #######");
            throw new UsernameNotFoundException("admin : " + username + " do not exist");
        }
    }

    public void save(AdminVO adminVO){
        adminMapper.save(adminVO);
    }

    public void saveRole(){

    }
}
