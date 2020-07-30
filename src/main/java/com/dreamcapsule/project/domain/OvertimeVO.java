package com.dreamcapsule.project.domain;

import oracle.sql.CHAR;

public class OvertimeVO {

    /** 시퀀스 */
    private int seq;

    /** 생성일자 */
    private String regDt;

    /** 수정일자 */
    private String modDt;

    /** 직원 */
    private String empNm;

    /** 직무 */
    private String empJob;

    /** 직급 */
    private String empPos;

    /** 야근날짜 */
    private String otDt;

    /** 야근시간 */
    private String otTm;

    /** 석식여부 */
    private String eatYn;

    /** 상태 */
    private String status;

    /** 메모 */
    private String content;

    /** 신청날짜 */
    private String reqDt;

    /** 답변 */
    private String ans;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getRegDt() {
        return regDt;
    }

    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }

    public String getModDt() {
        return modDt;
    }

    public void setModDt(String modDt) {
        this.modDt = modDt;
    }

    public String getEmpNm() {
        return empNm;
    }

    public void setEmpNm(String empNm) {
        this.empNm = empNm;
    }

    public String getEmpJob() {
        return empJob;
    }

    public void setEmpJob(String empJob) {
        this.empJob = empJob;
    }

    public String getEmpPos() {
        return empPos;
    }

    public void setEmpPos(String empPos) {
        this.empPos = empPos;
    }

    public String getOtDt() {
        return otDt;
    }

    public void setOtDt(String otDt) {
        this.otDt = otDt;
    }

    public String getOtTm() {
        return otTm;
    }

    public void setOtTm(String otTm) {
        this.otTm = otTm;
    }

    public String getEatYn() {
        return eatYn;
    }

    public void setEatYn(String eatYn) {
        this.eatYn = eatYn;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReqDt() {
        return reqDt;
    }

    public void setReqDt(String reqDt) {
        this.reqDt = reqDt;
    }

    public String getAns() {
        return ans;
    }

    public void setAns(String ans) {
        this.ans = ans;
    }
}
