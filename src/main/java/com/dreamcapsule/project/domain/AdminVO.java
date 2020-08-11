package com.dreamcapsule.project.domain;


import lombok.ToString;

@ToString
public class AdminVO {


    /** 관리자 회원 시퀀스 **/
    private int adminSeq;

    /** 관리자 아이디 **/
    private String adminId;

    /** 관리자 비밀번호 **/
    private String adminPwd;

    /** 관리자 회원 이름 **/
    private String adminNm;

    /** 관리자 권한 시퀀스 **/
    private String authNo;

    /** 관리자 권한 이름 **/
    private String authNm;



    public int getAdminSeq() {
        return adminSeq;
    }

    public void setAdminSeq(int adminSeq) {
        this.adminSeq = adminSeq;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd;
    }

    public String getAuthNo() {
        return authNo;
    }

    public void setAuthNo(String authNo) {
        this.authNo = authNo;
    }

    public String getAuthNm() {
        return authNm;
    }

    public void setAuthNm(String authNm) {
        this.authNm = authNm;
    }

    public String getAdminNm() {
        return adminNm;
    }

    public void setAdminNm(String adminNm) {
        this.adminNm = adminNm;
    }


}
