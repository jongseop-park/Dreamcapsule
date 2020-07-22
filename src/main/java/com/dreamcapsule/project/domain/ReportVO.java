package com.dreamcapsule.project.domain;

import sun.java2d.pipe.SpanShapeRenderer;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ReportVO {

    /** 시퀀스 */
    int sequence;

    /** 생성일자 */
    String registerDate;

    /** 직원 */
    String empName;

    /** 입사일 */
    String hireDate;

    /** 실제근로일수 */
    int workDate;

    /** 실제근로시간 */
    String workTime;

    /** 유급휴가시간 */
    String payVacationTime;

    /** 실제초과근로시간 */
    String overtimeWorkTime;

    /** 계획야간근로시간 */
    String planOvertime;

    /** 실제야간근로시간 */
    String actualOvertime;

    /** 사용휴가횟수  */
    int vacationCount;

    /** 전체휴가횟수 */
    int vacationTotal;

    /** 지각횟수*/
    int lateCount;

    /** 결근횟수 */
    int absentCount;

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

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getHireDate() {
        return hireDate;
    }

    public void setHireDate(String hireDate) {
        this.hireDate = hireDate;
    }

    public int getWorkDate() {
        return workDate;
    }

    public void setWorkDate(int workDate) {
        this.workDate = workDate;
    }

    public String getWorkTime() {
        return workTime;
    }

    public void setWorkTime(String workTime) {
        this.workTime = workTime;
    }

    public String getPayVacationTime() {
        return payVacationTime;
    }

    public void setPayVacationTime(String payVacationTime) {
        this.payVacationTime = payVacationTime;
    }

    public String getOvertimeWorkTime() {
        return overtimeWorkTime;
    }

    public void setOvertimeWorkTime(String overtimeWorkTime) {
        this.overtimeWorkTime = overtimeWorkTime;
    }

    public String getPlanOvertime() {
        return planOvertime;
    }

    public void setPlanOvertime(String planOvertime) {
        this.planOvertime = planOvertime;
    }

    public String getActualOvertime() {
        return actualOvertime;
    }

    public void setActualOvertime(String actualOvertime) {
        this.actualOvertime = actualOvertime;
    }

    public int getVacationCount() {
        return vacationCount;
    }

    public void setVacationCount(int vacationCount) {
        this.vacationCount = vacationCount;
    }

    public int getVacationTotal() {
        return vacationTotal;
    }

    public void setVacationTotal(int vacationTotal) {
        this.vacationTotal = vacationTotal;
    }

    public int getLateCount() {
        return lateCount;
    }

    public void setLateCount(int lateCount) {
        this.lateCount = lateCount;
    }

    public int getAbsentCount() {
        return absentCount;
    }

    public void setAbsentCount(int absentCount) {
        this.absentCount = absentCount;
    }
}
