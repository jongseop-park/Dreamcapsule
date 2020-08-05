package com.dreamcapsule.project.apps.holiday.domain;

import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;

public class Criteria {
    private int seq;
    private Long year;
    private int month;
    private String task;
    private String sortingValue;
    private String sortingType;

    public void setSeq(int seq){this.seq = seq;}

    public int getSeq(){return seq;}

    public void setYear(Long year){this.year = year;}

    public Long getYear(){
        if(year == null){
            int todayYear = Calendar.getInstance().get(Calendar.YEAR);
            String strYear = Integer.toString(todayYear);
            Long lYear = Long.parseLong(strYear);
            return lYear;
        }
        return year;
    }

    public void setMonth(int month){this.month = month;}

    public int getMonth(){return month;}

    public void setTask(String task){this.task = task;}

    public String getTask(){
        if(task == null) {
            return "0";
        }
        return task;
    }

    public void setSortingValue(String sortingValue){this.sortingValue = sortingValue;}

    public String getSortingValue(){
        if(sortingValue == null){
            return "SEQ";
        }
        return sortingValue;
    }

    public void setSortingType(String sortingType){this.sortingType = sortingType;}

    public String getSortingType(){
        if(sortingType == null){
            return "DESC";
        }
        return sortingType;
    }
}
