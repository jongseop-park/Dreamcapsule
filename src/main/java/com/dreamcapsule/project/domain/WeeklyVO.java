package com.dreamcapsule.project.domain;

public class WeeklyVO {

    private String emplNm;
    private String dutyId;
    private String rankId;
    private String commTi;
    private String workSt;
    private int workTi;
    private int restTi;
    private String workPl;
    private int totalTi;
    private String regDt;
    private String weekDate;

    public String getWeekDate() {
        return weekDate;
    }

    public void setWeekDate(String weekDate) {
        this.weekDate = weekDate;
    }

    public String getEmplNm() {
        return emplNm;
    }

    public void setEmplNm(String emplNm) {
        this.emplNm = emplNm;
    }

    public String getDutyId() {
        return dutyId;
    }

    public void setDutyId(String dutyId) {
        this.dutyId = dutyId;
    }

    public String getRankId() {
        return rankId;
    }

    public void setRankId(String rankId) {
        this.rankId = rankId;
    }

    public String getCommTi() {
        return commTi;
    }

    public void setCommTi(String commTi) {
        this.commTi = commTi;
    }

    public String getWorkPl() {
        return workPl;
    }

    public void setWorkPl(String workPl) {
        this.workPl = workPl;
    }

    public int getTotalTi() {
        return totalTi;
    }

    public void setTotalTi(int totalTi) {
        this.totalTi = totalTi;
    }

    public String getRegDt() {
        return regDt;
    }

    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }

    public String getWorkSt() {
        return workSt;
    }

    public void setWorkSt(String workSt) {
        this.workSt = workSt;
    }

    public int getWorkTi() {
        return workTi;
    }

    public void setWorkTi(int workTi) {
        this.workTi = workTi;
    }

    public int getRestTi() {
        return restTi;
    }

    public void setRestTi(int restTi) {
        this.restTi = restTi;
    }
}