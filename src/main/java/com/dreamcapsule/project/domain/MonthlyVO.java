package com.dreamcapsule.project.domain;

public class MonthlyVO {

    private int day;
    private String dy;

    private String emplNm;
    private String monthlyday;
    private String commTi;
    private String workSt;
    private int lastdayNum;
    private String dutyNm;


    public String getDutyNm() {
        return dutyNm;
    }

    public void setDutyNm(String dutyNm) {
        this.dutyNm = dutyNm;
    }

    public String getMonthlyday() {
        return monthlyday;
    }

    public void setMonthlyday(String monthlyday) {
        this.monthlyday = monthlyday;
    }

    public String getCommTi() {
        return commTi;
    }

    public void setCommTi(String commTi) {
        this.commTi = commTi;
    }

    public String getWorkSt() {
        return workSt;
    }

    public void setWorkSt(String workSt) {
        this.workSt = workSt;
    }

    public int getLastdayNum() {
        return lastdayNum;
    }

    public void setLastdayNum(int lastdayNum) {
        this.lastdayNum = lastdayNum;
    }

    public String getEmplNm() {
        return emplNm;
    }

    public void setEmplNm(String emplNm) {
        this.emplNm = emplNm;
    }



    public String getDy() {
        return dy;
    }

    public void setDy(String dy) {
        this.dy = dy;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }
}
