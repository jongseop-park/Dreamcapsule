package com.dreamcapsule.project.domain;


import lombok.Getter;
import lombok.Setter;


public class DailyDomain {

    private String emplNm;
    private String dutyId;
    private String rankId;
    private String onwTi;
    private String offwTi;
    private String workSt;
    private int workTi;
    private int restTi;
    private String workPl;
    private String workAd;
    private int totalTi;
    private int tardyCt;
    private int abtiCt;
    private String regDt;

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

    public String getOnwTi() {
        return onwTi;
    }

    public void setOnwTi(String onwTi) {
        this.onwTi = onwTi;
    }

    public String getOffwTi() {
        return offwTi;
    }

    public void setOffwTi(String offwTi) {
        this.offwTi = offwTi;
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

    public String getWorkPl() {
        return workPl;
    }

    public void setWorkPl(String workPl) {
        this.workPl = workPl;
    }

    public String getWorkAd() {
        return workAd;
    }

    public void setWorkAd(String workAd) {
        this.workAd = workAd;
    }

    public int getTotalTi() {
        return totalTi;
    }

    public void setTotalTi(int totalTi) {
        this.totalTi = totalTi;
    }

    public int getTardyCt() {
        return tardyCt;
    }

    public void setTardyCt(int tardyCt) {
        this.tardyCt = tardyCt;
    }

    public int getAbtiCt() {
        return abtiCt;
    }

    public void setAbtiCt(int abtiCt) {
        this.abtiCt = abtiCt;
    }

    public String getRegDt() {
        return regDt;
    }

    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }
}
