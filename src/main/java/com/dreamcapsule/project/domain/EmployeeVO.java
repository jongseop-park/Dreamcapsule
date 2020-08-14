package com.dreamcapsule.project.domain;



public class EmployeeVO {

    /**직원 시퀀스**/
    private int empSeq;
    /**직원 이름**/
    private String emplNm;
    /**직원 직무**/
    private String dutyNm;
    /**직원 직급**/
    private String rankNm;
    /**직원 이메일**/
    private String email;
    /**직원 전화번호**/
    private String tel;
    /**직원 등록 날짜**/
    private String regDt;
    /**수정 날짜**/
    private String modDt;
    /**근무지**/
    private String placeNm;
    /**권한**/
    private String authNm;
    /**직무 리스트 및 시퀀스**/
    private String dutyList;
    private int dutylistSeq;
    /**근무지 리스트 및 시퀀스**/
    private String placeList;
    private int placelistSeq;
    /**직급 리스트 및 시퀀스**/
    private String rankList;
    private int ranklistSeq;
    /**권한 리스트 및 시퀀스**/
    private String authList;
    private int authlistSeq;
    /**입사 날짜**/
    private String joinDt;
    /**Form page 구분 / true = 직원추가 / false = 직원관리 **/
    private boolean pagecheck;




    public boolean isPagecheck() {
        return pagecheck;
    }

    public void setPagecheck(boolean pagecheck) {
        this.pagecheck = pagecheck;
    }

    public String getJoinDt() {
        return joinDt;
    }

    public void setJoinDt(String joinDt) {
        this.joinDt = joinDt;
    }

    public String getDutyList() {
        return dutyList;
    }

    public void setDutyList(String dutyList) {
        this.dutyList = dutyList;
    }

    public int getDutylistSeq() {
        return dutylistSeq;
    }

    public void setDutylistSeq(int dutylistSeq) {
        this.dutylistSeq = dutylistSeq;
    }

    public String getPlaceList() {
        return placeList;
    }

    public void setPlaceList(String placeList) {
        this.placeList = placeList;
    }

    public int getPlacelistSeq() {
        return placelistSeq;
    }

    public void setPlacelistSeq(int placelistSeq) {
        this.placelistSeq = placelistSeq;
    }

    public String getRankList() {
        return rankList;
    }

    public void setRankList(String rankList) {
        this.rankList = rankList;
    }

    public int getRanklistSeq() {
        return ranklistSeq;
    }

    public void setRanklistSeq(int ranklistSeq) {
        this.ranklistSeq = ranklistSeq;
    }

    public String getAuthList() {
        return authList;
    }

    public void setAuthList(String authList) {
        this.authList = authList;
    }

    public int getAuthlistSeq() {
        return authlistSeq;
    }

    public void setAuthlistSeq(int authlistSeq) {
        this.authlistSeq = authlistSeq;
    }

    public int getEmpSeq() {
        return empSeq;
    }

    public void setEmpSeq(int empSeq) {
        this.empSeq = empSeq;
    }

    public String getEmplNm() {
        return emplNm;
    }

    public void setEmplNm(String emplNm) {
        this.emplNm = emplNm;
    }

    public String getDutyNm() {
        return dutyNm;
    }

    public void setDutyNm(String dutyNm) {
        this.dutyNm = dutyNm;
    }

    public String getRankNm() {
        return rankNm;
    }

    public void setRankNm(String rankNm) {
        this.rankNm = rankNm;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getRegDt() {
        return regDt;
    }

    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }

    public String getModDt() {
        return modDt;
    }

    public void setModDt(String modDt) {
        this.modDt = modDt;
    }

    public String getPlaceNm() {
        return placeNm;
    }

    public void setPlaceNm(String placeNm) {
        this.placeNm = placeNm;
    }

    public String getAuthNm() {
        return authNm;
    }

    public void setAuthNm(String authNm) {
        this.authNm = authNm;
    }
}
