package com.dreamcapsule.project.apps.holiday.service;

import com.dreamcapsule.project.domain.HolidayVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HolidayService {

    public List<HolidayVO> findByValue(int seq,Long year,int month);
    public HolidayVO findByInfoValue(int seq,Long year);
    public List<HolidayVO> findAll(String sortValue,String sortType,Long year);
    public List<HolidayVO> findTask();
    public List<HolidayVO> findYear();
    public HolidayVO findUse(Long num,Long year,int month);
    List<HolidayVO> findTaskMember(String task, Long year);
    public void detailsUpdate(int seq,char state,String reply);
    public Long findUseYear(int seq,Long year);
    public void holidayInsert(int userNum,String holidayType,String holidayYear,String holidayMonth,String holidayDate,String note,String useHoliday);
    public String[][] holidayMonthUse(Long year,String task,List<HolidayVO> holidayList);
    public Long[] matchTaskSeq(String task,List<HolidayVO> holidayList,Long year);
    public Long[] totalUseDay(String task,Long year,List<HolidayVO> holidayList);
    public List<HolidayVO> findUseState(Long year,String sortValue,String sortType);
}
