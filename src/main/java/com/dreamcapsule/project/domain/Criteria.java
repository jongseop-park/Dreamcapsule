package com.dreamcapsule.project.domain;

import org.springframework.web.util.UriComponentsBuilder;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class Criteria {
//페이징 처리를 위한 멤버------------------------------------------------------------------------------------------
    private int page;
    private int perPageNum;
    private int rowStart;
    private int rowEnd;
    private int seqNum;
//검색 기능을 위한 멤버--------------------------------------------------------------------------------------------

    private String regDt;
    private String keyword;
//주간,월간 추출 위한 멤버-----------------------------------------------------------------------------------------
    private String startDate;
    private String endDate;
//정렬을 위한 멤버-----------------------------------------------------------------------------------------------
    private String orderKeyword="reg_dt"; //sql문 row_number() 안에 기본 정열이 들어가야 하므로
    private String eorderKeyword="emp.empl_nm";
    private String worderKeyword="empl_nm";
    private String orderMethod="asc";     //초기화
//-------------------------------------------------------------------------------------------------------------
    public Criteria(){
        this.page=1;
        this.perPageNum =10;
            SimpleDateFormat sformat = new SimpleDateFormat("yyyy/MM/dd");

            Calendar cal = Calendar.getInstance();
            Date today=new Date();
            cal.setTime(today); //현재 날짜
            regDt = sformat.format(cal.getTime());
//            regDt= cal.get(Calendar.YEAR) +"/" + (cal.get(Calendar.MONTH) +1) +"/"+cal.get(Calendar.DAY_OF_MONTH);
//            regDt=sformat.format(d);


            //일주일을 월~일로 가정하여 월요일추출
            cal.add(Calendar.DAY_OF_MONTH,(2-cal.get(Calendar.DAY_OF_WEEK)));
            startDate = sformat.format(cal.getTime());
            //일요일 추출
            cal.add(Calendar.DAY_OF_MONTH,(8-cal.get(Calendar.DAY_OF_WEEK)));
            endDate = sformat.format(cal.getTime());


    }

    public int getSeqNum() {
        return seqNum;
    }

    public void setSeqNum(int seqNum) {
        this.seqNum = seqNum;
    }

    public String getWorderKeyword() {
        return worderKeyword;
    }

    public void setWorderKeyword(String worderKeyword) {
        this.worderKeyword = worderKeyword;
    }

    public String getOrderKeyword() {
        return orderKeyword;
    }

    public void setOrderKeyword(String orderKeyword) {
        this.orderKeyword = orderKeyword;
    }

    public String getOrderMethod() {
        return orderMethod;
    }

    public void setOrderMethod(String orderMethod) {
        this.orderMethod = orderMethod;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public void setPage(int page){
        if(page <= 0){
            this.page = 1;
            return;
        }
        this.page = page;
    }


    public void setPerPageNum(int perPageNum) {
        if (perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 10;
            return;
        }
        this.perPageNum = perPageNum;
    }

    public int getPage() {
        return page;
    }

    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }

    public int getPerPageNum() {
        return this.perPageNum;
    }

    public int getRowStart() {
        rowStart = ((page - 1) * perPageNum) + 1;
        return rowStart;
    }

    public int getRowEnd() {
        rowEnd = rowStart + perPageNum - 1;
        return rowEnd;
    }


    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getRegDt() {
        return regDt;
    }

    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }

    public String getEorderKeyword() {
        return eorderKeyword;
    }

    public void setEorderKeyword(String eorderKeyword) {
        this.eorderKeyword = eorderKeyword;
    }

    @Override
    public String toString() {
        return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
                + "]";
    }
//
//    public String makeQuery(int page){
//        UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
//                .queryParam("page",page)
//                .queryParam("perPageNum", this.getPerPageNum());
//        if(keyword!=null && regDt == null){
//            uriComponentsBuilder
//
//                    .queryParam("keyword",this.keyword);
//        }else if(keyword==null && regDt != null){
//            uriComponentsBuilder
//
//                    .queryParam("regDt",this.regDt);
//        }
//        return uriComponentsBuilder.build().encode().toString();
//    }
//
//    public String weekmakeQuery(int page){
//        UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
//                .queryParam("page",page)
//                .queryParam("perPageNum", this.getPerPageNum());
//        if(keyword!=null && regDt == null){
//            uriComponentsBuilder
//
//                    .queryParam("keyword",this.keyword);
//        }else if(keyword==null && regDt != null){
//            uriComponentsBuilder
//
//                    .queryParam("regDt",this.regDt);
//        }
//        return uriComponentsBuilder.build().encode().toString();
//    }
//


}
