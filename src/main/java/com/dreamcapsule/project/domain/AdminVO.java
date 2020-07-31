package com.dreamcapsule.project.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class AdminVO implements UserDetails {

    /** 관리자 아이디 */
    private String adminId;

    /** 관리자 패스워드 */
    private String adminPw;

    /** 관리자 이름 */
    private String adminNm;

    /** 관리자 이메일 */
    private String adminEmail;

    /** 관리자 연락처 */
    private String adminTel;

    /** 로그인 실패 횟수 */
    private Integer failCnt;

    /** 최종 접속 일시 */
    private String lastLoginDt;

    /** 권한 테이블 */
    private Collection<? extends GrantedAuthority> roles;

    /** ROLE */
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.roles;
    }

    @Override
    public boolean isAccountNonExpired() { return true; }

    @Override
    public boolean isAccountNonLocked() { return true; }

    @Override
    public boolean isCredentialsNonExpired() { return true; }

    @Override
    public boolean isEnabled() { return true; }

    @Override
    public String getPassword() {
        // TODO Auto-generated method stub
        return this.adminPw;
    }

    @Override
    public String getUsername() {
        // TODO Auto-generated method stub
        return this.adminId;
    }
    /** */

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getAdminPw() {
        return adminPw;
    }

    public void setAdminPw(String adminPw) {
        this.adminPw = adminPw;
    }

    public String getAdminNm() {
        return adminNm;
    }

    public void setAdminNm(String adminNm) {
        this.adminNm = adminNm;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminTel() {
        return adminTel;
    }

    public void setAdminTel(String adminTel) {
        this.adminTel = adminTel;
    }

    public Integer getFailCnt() {
        return failCnt;
    }

    public void setFailCnt(Integer failCnt) {
        this.failCnt = failCnt;
    }

    public String getLastLoginDt() {
        return lastLoginDt;
    }

    public void setLastLoginDt(String lastLoginDt) {
        this.lastLoginDt = lastLoginDt;
    }

    public void setRoles(Collection<? extends GrantedAuthority> roles) {
        this.roles = roles;
    }
}
