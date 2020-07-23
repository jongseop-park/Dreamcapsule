package com.dreamcapsule.project.domain;

import oracle.sql.CHAR;

public class OvertimeVO {

    /** 시퀀스 */
    private int sequence;

    /** 생성일자 */
    private String registerDate;

    /** 수정일자 */
    private String modifyDate;

    /** 직원 */
    private String empName;

    /** 직무 */
    private String empJob;

    /** 직급 */
    private String empPosition;

    /** 야근날짜 */
    private String overtimeDate;

    /** 야근시간 */
    private String overtimeTime;

    /** 석식여부 */
    private String eatBoolean;

    /** 상태 */
    private String status;

    /** 메모 */
    private String contents;

    /** 신청날짜 */
    private String requestDate;

    /** 답변 */
    private String answer;


    public int getSequence() {
        return sequence;
    }

    public void setSequence(int sequence) {
        this.sequence = sequence;
    }

    public String getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(String registerDate) {
        this.registerDate = registerDate;
    }

    public String getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpJob() {
        return empJob;
    }

    public void setEmpJob(String empJob) {
        this.empJob = empJob;
    }

    public String getEmpPosition() {
        return empPosition;
    }

    public void setEmpPosition(String empPosition) {
        this.empPosition = empPosition;
    }

    public String getOvertimeDate() {
        return overtimeDate;
    }

    public void setOvertimeDate(String overtimeDate) {
        this.overtimeDate = overtimeDate;
    }

    public String getOvertimeTime() {
        return overtimeTime;
    }

    public void setOvertimeTime(String overtimeTime) {
        this.overtimeTime = overtimeTime;
    }

    public String getEatBoolean() {
        return eatBoolean;
    }

    public void setEatBoolean(String eatBoolean) {
        this.eatBoolean = eatBoolean;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(String requestDate) {
        this.requestDate = requestDate;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
