package com.dreamcapsule.project.domain;

import java.time.LocalDateTime;
import java.util.List;

public class AdminVO {

    /** 시퀀스 */
    private Integer seq;

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
    private LocalDateTime lastLoginDt;

    /** 등록일자 */
    private LocalDateTime regDt;

    /** 수정일자 */
    private LocalDateTime modDt;

    /** 권한 */
    private boolean enabled;

    /** 권한 테이블 */
    private List<AuthorityVO>  authList;


    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

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

    public LocalDateTime getLastLoginDt() {
        return lastLoginDt;
    }

    public void setLastLoginDt(LocalDateTime lastLoginDt) {
        this.lastLoginDt = lastLoginDt;
    }

    public LocalDateTime getRegDt() {
        return regDt;
    }

    public void setRegDt(LocalDateTime regDt) {
        this.regDt = regDt;
    }

    public LocalDateTime getModDt() {
        return modDt;
    }

    public void setModDt(LocalDateTime modDt) {
        this.modDt = modDt;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public List<AuthorityVO> getAuthList() {
        return authList;
    }

    public void setAuthList(List<AuthorityVO> authList) {
        this.authList = authList;
    }
}
