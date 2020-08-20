package com.dreamcapsule.project.apps.report.domain;

import java.util.Calendar;

public class SearchCriteria extends Criteria {
     private String keyword = "";
     private String startDate = "";
     private String endDate = "";
     private String order = "";
     private String orderKeyword = "";
     private String tempStartDate;
     private String tempEndDate;

     public SearchCriteria getSearchCriteria() {
         return this;
     }

    public String getOrderKeyword() {
        if(orderKeyword.equals(""))
            return "emp_seq";

        return orderKeyword;
    }

    public void setOrderKeyword(String orderKeyword) {
        this.orderKeyword = orderKeyword;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }


     public SearchCriteria() {
         setDate();
     }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getStartDate() {
         if(startDate.equals(""))
            return tempStartDate;

        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
         if(endDate.equals(""))
             return tempEndDate;
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return super.toString() + " SearchCriteria [keyword=" + keyword
                + keyword + ",startDate=" + startDate + ",endDate=" + endDate + "]";
    }

    public void setDate() {
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        int dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

        tempStartDate = year + "-" + String.format("%02d", month) + "-01";
        tempEndDate = year + "-" + String.format("%02d", month) + "-" + String.format("%02d", dayOfMonth);
    }
}
