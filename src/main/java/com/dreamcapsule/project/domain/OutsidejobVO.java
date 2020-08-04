package com.dreamcapsule.project.domain;

import java.util.Date;

public class OutsidejobVO {

    /** 시퀀스 */
    private Long seq;

    /** 이름 */
    private String name;

    /** 직무 */
    private String task;

    /** 직급 */
    private String jobGrade;

    /** 외근 기간 */
    private String outsideDate;

    /** 출근 시간 */
    private String startTime;

    /** 퇴근 시간 */
    private String endTime;

    /** 출근지 */
    private String startPlace;

    /** 퇴근지 */
    private String endPlace;

    /** 외근 승인 여부 */
    private char stateYsn;

    /** 신청 날짜 */
    private Date applicationTime;

    /** 메모 */
    private String note;

    /** 답변 */
    private String reply;

    /** 직무 노출 여부 */
    private char taskYn;

    /** 등록 일시 */
    private Date regDt;

    /** 수정 일시 */
    private Date modDt;

    /** info seq */
    private Long userNum;

    /** 외근 달 */
    private String month;

    /** 외근 일수 */
    private Long day;
    public Long getSeq(){return seq;}

    public void setSeq(Long seq){this.seq = seq;}

    public String getName(){return name;}

    public void setName(String name){this.name = name;}

    public String getTask(){return task;}

    public void setTask(String task){this.task = task;}

    public String getJobGrade(){return jobGrade;}

    public void setJobGrade(String jobGrade){this.jobGrade = jobGrade;}

    public String getOutsideDate(){return outsideDate;}

    public void setOutsideDate(String outsideDate){this.outsideDate = outsideDate;}

    public String getStartTime(){return startTime;}

    public void setStartTime(String startTime){this.startTime = startTime;}

    public String getEndTime(){return endTime;}

    public void setEndTime(String endTime){this.endTime = endTime;}

    public String getStartPlace(){return startPlace;}

    public void setStartPlace(String startPlace){this.startPlace = startPlace;}

    public String getEndPlace(){return endPlace;}

    public void setEndPlace(String endPlace){this.endPlace = endPlace;}

    public char getStateYsn(){return stateYsn;}

    public void setStateYsn(char stateYsn){this.stateYsn = stateYsn;}

    public Date getApplicationTime(){return applicationTime;}

    public void setApplicationTime(Date applicationTime){this.applicationTime = applicationTime;}

    public String getNote(){return note;}

    public void setNote(String note){this.note = note;}

    public String getReply(){return reply;}

    public void setReply(String reply){this.reply = reply;}

    public char getTaskYn(){return taskYn;}

    public void setTaskYn(char taskYn){this.taskYn = taskYn;}

    public Date getRegDt(){return regDt;}

    public void setRegDt(Date regDt){this.regDt = regDt;}

    public Date getModDt(){return modDt;}

    public void setModDt(Date modDt){this.modDt = modDt;}

    public Long getUserNum(){return userNum;}

    public void setUserNum(Long userNum){this.userNum = userNum;}

    public String getMonth(){return  month;}

    public void setMonth(String month){this.month = month;}

    public Long getDay(){return day;}

    public void setDay(Long day){this.day = day;}
}
