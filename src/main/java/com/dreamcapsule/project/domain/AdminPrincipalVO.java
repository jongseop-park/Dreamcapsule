package com.dreamcapsule.project.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class AdminPrincipalVO implements UserDetails {

    private ArrayList<AdminVO> adminVO;

    public AdminPrincipalVO(ArrayList<AdminVO> userAuthes){
        this.adminVO = userAuthes;
    }

    public AdminPrincipalVO(){}
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for(int x = 0; x<adminVO.size(); x++){
            authorities.add(new SimpleGrantedAuthority(adminVO.get(x).getRoleName()));
        }
        return authorities;
    }

    @Override
    public String getPassword() {
        return adminVO.get(0).getUserPass();
    }

    @Override
    public String getUsername() {
        return adminVO.get(0).getUserName();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
