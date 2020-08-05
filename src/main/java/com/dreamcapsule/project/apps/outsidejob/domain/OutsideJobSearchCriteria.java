package com.dreamcapsule.project.apps.outsidejob.domain;

import java.util.Calendar;

public class OutsideJobSearchCriteria extends OutsideJobCriteria{
    private String keyword = "";
    private String sortKeyword = "";
    private String sort = "";
    private int[] searchMonth;
    private String startDate;
    private String endDate;
    private int[] selectDate;

    OutsideJobSearchCriteria() {
        Calendar cal = Calendar.getInstance();
        searchMonth = new int[4];
        searchMonth[0] = cal.get(Calendar.YEAR);
        searchMonth[1] = cal.get(Calendar.MONTH) + 1;
        searchMonth[2] = cal.get(Calendar.YEAR);
        searchMonth[3] = cal.get(Calendar.MONTH) + 1;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword){
        this.keyword = keyword;
    }

    public String getSortKeyword() {
        if(sortKeyword.equals("")){
            return "seq";
        }
        return sortKeyword;
    }

    public void setSortKeyword(String sortKeyword){this.sortKeyword = sortKeyword;}

    public String getSort(){return sort;}

    public void setSort(String sort){this.sort = sort;}

    public int[] getSearchMonth(){return searchMonth;}

    public void setSearchMonth(int[] searchDate){
        setSelectDate(searchDate);
        int[] year = new int[searchDate.length/2];
        int[] month = new int[searchDate.length/2];
        int y = 0;

        for(int cnt = 0; cnt < searchDate.length/2;cnt++){
            year[cnt] = searchDate[y++];
            month[cnt] = searchDate[y++];
        }

        int yearCnt = year[year.length-1] - year[0];
        int size = 0;
        if(year[0] == year[1]) {
            size = month[1]-month[0] + yearCnt + 2;
        }else{
            size += 12-month[0];
            size += month[1];
            if(year[1] - year[0] > 1) {
                size += (year[1] - year[0] - 1) * 12;
            }
            size += yearCnt + 2;
        }
        searchMonth = new int[size];

        int searchMonthCnt = 0;

        if(yearCnt > 0){
            for(int setCnt = 0;setCnt < (yearCnt + 1);setCnt++){
                int setMonth = 0;
                searchMonth[searchMonthCnt++] = year[0] + setCnt;
                if(setCnt == 0){
                    setMonth = month[0];
                    for(;setMonth <= 12; setMonth++){
                        searchMonth[searchMonthCnt++] = setMonth;
                    }
                }else if(setCnt == yearCnt){
                    for(setMonth=1;setMonth <= month[month.length-1]; setMonth++){
                        searchMonth[searchMonthCnt++] = setMonth;
                    }
                }else{
                    for(setMonth = 1; setMonth <= 12;setMonth++){
                        searchMonth[searchMonthCnt++] = setMonth;
                    }
                }
            }
        }else{
            searchMonth[searchMonthCnt++] = year[0];
            for(int cnt = month[0]; cnt <= month[1];cnt++){
                searchMonth[searchMonthCnt++] = cnt;
            }
        }
    }

    public String getStartDate(){return startDate;}

    public void setStartDate(String startDate){this.startDate = startDate;}

    public String getEndDate(){return endDate;}

    public void setEndDate(String endDate){this.endDate = endDate;}

    public int[] getSelectDate(){return selectDate;}

    public void setSelectDate(int[] selectDate){this.selectDate = selectDate;}

    @Override
    public String toString(){
        return "OutsideJobSearchCriteria [keyword=" + keyword + "]";
    }
}
