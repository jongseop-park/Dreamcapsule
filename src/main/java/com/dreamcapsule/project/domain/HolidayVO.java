package com.dreamcapsule.project.domain;

import java.util.Date;

public class HolidayVO {

    /** 시퀀스 */
    private Long seq;

    /** 이름 */
    private String name;

    /** 직무 */
    private String task;

    /** 직급 */
    private String jobGrade;

    /** 휴가유형 */
    private String holidayType;

    /** 휴가날짜 */
    private String holidayDate;

    /** 메모 */
    private String note;

    /** 신청날짜 */
    private Date applicationTime;

    /** 휴가 승인 여부 */
    private char stateYsn;

    /** 답변 */
    private String reply;

    /** 필터 표시 여부 */
    private char filterYn;

    /** 등록 일시 */
    private Date regDt;

    /** 수정일시 */
    private Date modDt;

    /** 잔여 휴가 일수 */
    private Long restHoliday;

    /** 휴가 년도 */
    private Long holidayYear;

    private Long userNum;

    private Long holidayMonth;

    private Long useHoliday;

    public Long getSeq() {
        return seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getJobGrade() {
        return jobGrade;
    }

    public void setJobGrade(String jobGrade) {
        this.jobGrade = jobGrade;
    }

    public String getHolidayType() {
        return holidayType;
    }

    public void setHolidayType(String holidayType) {
        this.holidayType = holidayType;
    }

    public String getHolidayDate() {
        return holidayDate;
    }

    public void setHolidayDate(String holidayDate) {
        this.holidayDate = holidayDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getApplicationTime() {
        return applicationTime;
    }

    public void setApplicationTime(Date applicationTime) {
        this.applicationTime = applicationTime;
    }

    public char getStateYsn() {
        return stateYsn;
    }

    public void setStateYsn(char stateYsn) {
        this.stateYsn = stateYsn;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public char getFilterYn() {
        return filterYn;
    }

    public void setFilterYn(char filterYn) {
        this.filterYn = filterYn;
    }

    public Date getRegDt() {
        return regDt;
    }

    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    public Date getModDt() {
        return modDt;
    }

    public void setModDt(Date modDt) {
        this.modDt = modDt;
    }

    public Long getRestHoliday() {
        return restHoliday;
    }

    public void setRestHoliday(Long restHoliday) {
        this.restHoliday = restHoliday;
    }

    public Long getHolidayYear(){return holidayYear;}

    public void setHolidayYear(Long holidayYear) {this.holidayYear = holidayYear; }

    public Long getUserNum(){return userNum;}

    public void setUserNum(Long userNum){this.userNum = userNum;}

    public Long getHolidayMonth(){return holidayMonth;}

    public void setHolidayMonth(Long holidayMonth) { this.holidayMonth = holidayMonth;}

    public Long getUseHoliday(){return useHoliday;}

    public void setUseHoliday(Long useHoliday){this.useHoliday = useHoliday;}
}
