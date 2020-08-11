package com.dreamcapsule.project.apps.outsidejob.domain;

import java.util.Calendar;

public class OutsideJobSearchCriteria extends OutsideJobCriteria{
    private String keyword = "";
    private String sortKeyword = "";
    private String sort = "";
    private int[] searchMonth;
    private String startDate;
    private String endDate;
    private String selectDate;

    OutsideJobSearchCriteria() {
        Calendar cal = Calendar.getInstance();
        searchMonth = new int[4];
        searchMonth[0] = cal.get(Calendar.YEAR);
        searchMonth[1] = cal.get(Calendar.MONTH) + 1;
        searchMonth[2] = cal.get(Calendar.YEAR);
        searchMonth[3] = cal.get(Calendar.MONTH) + 1;
        String strMonth = searchMonth[0] + "," + searchMonth[1] + "," + searchMonth[2] + "," + searchMonth[3];
        setSelectDate(strMonth);
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword){
        this.keyword = keyword;
    }

    public String getSortKeyword() {
        if(sortKeyword.equals("")){
            return "OUTSIDE_SEQ";
        }
        return sortKeyword;
    }

    public void setSortKeyword(String sortKeyword){this.sortKeyword = sortKeyword;}

    public String getSort(){return sort;}

    public void setSort(String sort){this.sort = sort;}

    public int[] getSearchMonth(){
        if(searchMonth[0] == searchMonth[2] && searchMonth[1] == searchMonth[3]){
            int[] reMonth = new int[2];
                    reMonth[0] = searchMonth[0];
                    reMonth[1] = searchMonth[1];
            return reMonth;
        }
        return searchMonth;
    }

    public void setSearchMonth(int[] searchDate){
        String strMonth = searchDate[0] + "," + searchDate[1] + "," + searchDate[2] + "," + searchDate[3];
        setSelectDate(strMonth);
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

    public String getSelectDate(){return selectDate;}

    public void setSelectDate(String selectDate){this.selectDate = selectDate;}

    @Override
    public String toString(){
        return "OutsideJobSearchCriteria [keyword=" + keyword + "]";
    }
}
