package com.dreamcapsule.project.domain;

import oracle.sql.CHAR;

public class OvertimeVO {


    private int sequence;
    private String registerDate;
    private String modifyDate;
    private String empName;
    private String empJob;
    private String empPosition;
    private String overtimeDate;
    private String overtimeTime;
    private String eatBoolean;
    private String status;
    private String contents;
    private String requestDate;
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
