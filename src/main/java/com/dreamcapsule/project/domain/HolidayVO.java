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
    private String job_grade;

    /** 휴가유형 */
    private String holiday_type;

    /** 휴가날짜 */
    private String holiday_date;

    /** 메모 */
    private String note;

    /** 신청날짜 */
    private Date application_time;

    /** 휴가 승인 여부 */
    private char state_ysn;

    /** 답변 */
    private String reply;

    /** 필터 표시 여부 */
    private char filter_yn;

    /** 등록 일시 */
    private Date reg_dt;

    /** 수정일시 */
    private Date mod_dt;

    /** 잔여 휴가 일수 */
    private Long rest_holiday;

    public Long getSeq(){return seq;}

    public void setSeq(Long seq){this.seq = seq;}

    public String getName(){return name;}

    public void setName(String name){this.name = name;}

    public String getTask(){return task;}

    public void setTask(String task){this.task = task;}

    public String getJob_grade(){return job_grade;}

    public void setJob_grade(String job_grade){this.job_grade = job_grade;}

    public String getHoliday_type(){return holiday_type;}

    public void setHoliday_type(String holiday_type){this.holiday_type = holiday_type;}

    public String getHoliday_date(){return holiday_date;}

    public void setHoliday_date(String holiday_date){this.holiday_date = holiday_date;}

    public String getNote(){return note;}

    public void setNote(String note){this.note = note;}

    public Date getApplication_time(){return application_time;}

    public void setApplication_time(Date application_time){this.application_time = application_time;}

    public char getState_ysn(){return state_ysn;}

    public void setState_ysn(char state_ysn){this.state_ysn = state_ysn;}

    public String getReply(){return reply;}

    public void setReply(String reply){this.reply = reply;}

    public char getFilter_yn(){return filter_yn;}

    public void setFilter_yn(char filter_yn){this.filter_yn = filter_yn;}

    public Date getReg_dt(){return reg_dt;}

    public void setReg_dt(Date reg_dt){this.reg_dt = reg_dt;}

    public Date getMod_dt(){return mod_dt;}

    public void setMod_dt(Date mod_dt){this.mod_dt = mod_dt;}

    public Long getRest_holiday(){return rest_holiday;}

    public void setRest_holiday(Long rest_holiday){this.rest_holiday = rest_holiday;}
}
