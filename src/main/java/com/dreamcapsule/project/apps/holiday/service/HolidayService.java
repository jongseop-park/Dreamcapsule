package com.dreamcapsule.project.apps.holiday.service;

import com.dreamcapsule.project.domain.HolidayVO;

import java.util.List;

public interface HolidayService {

    public List<HolidayVO> findByValue(int seq,Long year,int month);
    public HolidayVO findByInfoValue(int seq);
    public List<HolidayVO> findAll(String sortValue,String sortType);
    public List<HolidayVO> findTask();
    public List<HolidayVO> findYear();
    public HolidayVO findUse(Long num,Long year,int month);
    public List<HolidayVO> findTaskMember(String task);
    public void detailsUpdate(int seq,char state,String reply);
    public int findUseYear(int seq,Long year);
    public void holidayInsert(int userNum,String holidayType,String holidayYear,String holidayMonth,String holidayDate,String note,String useHoliday);
    public String[][] holidayMonthUse(Long year,String task,List<HolidayVO> holidayList);
    public Long[] matchTaskSeq(String task,List<HolidayVO> holidayList);
    public Long[] totalUseDay(String task,Long year,List<HolidayVO> holidayList);
}
