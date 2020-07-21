package com.dreamcapsule.project.domain;

import java.time.LocalDateTime;
import java.util.Date;

public class CompanyVO extends Criteria{

    /** 시퀀스 */
    private String seq;

    /** 업체명 */
    private String companyNm;

    /** 직원수 */
    private String empNum;

    /** 주소 */
    private String address;

    /** 담당자명 */
    private String contactNm;

    /** 전화번호 */
    private String tel;

    /** 이메일 */
    private String email;

    /** 메모 */
    private String memo;

    /** 등록일자 */
    private String regDate;

    /** 수정일자 */
    private String modDate;

    /** 삭제여부 */
    private String delYn;

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getCompanyNm() {
        return companyNm;
    }

    public void setCompanyNm(String companyNm) {
        this.companyNm = companyNm;
    }

    public String getEmpNum() {
        return empNum;
    }

    public void setEmpNum(String empNum) {
        this.empNum = empNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContactNm() {
        return contactNm;
    }

    public void setContactNm(String contactNm) {
        this.contactNm = contactNm;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getModDate() {
        return modDate;
    }

    public void setModDate(String modDate) {
        this.modDate = modDate;
    }

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }
}
