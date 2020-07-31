package com.dreamcapsule.project.domain;


import lombok.Getter;
import lombok.Setter;
import org.springframework.context.annotation.Configuration;

import java.text.SimpleDateFormat;


public class DailyDomain {

    private String emplNm;
    private String dutyId;
    private String rankId;
    private String commTi;
    private String workSt;
    private int workTi;
    private int restTi;
    private String workPl;
    private String workAd;
    private int totalTi;
    private int tardyCt;
    private int abtiCt;
    private String regDt;
    private String startTime;
    private String endTime;
    private String onwTi;
    private String offwTi;

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

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
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
        this.regDt =regDt;
    }
}
