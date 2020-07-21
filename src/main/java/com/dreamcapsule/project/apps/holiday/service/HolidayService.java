package com.dreamcapsule.project.apps.holiday.service;

import com.dreamcapsule.project.domain.HolidayVO;

import java.util.List;

public interface HolidayService {

    public List<HolidayVO> findByValue(int seq,int year,int month);
    public HolidayVO findByInfoValue(int seq);
    public List<HolidayVO> findAll(String sortValue,String sortType);
    public List<HolidayVO> findByName(String name);
    public List<HolidayVO> findTask();
    public List<HolidayVO> findYear();
    public HolidayVO findUse(Long num,Long year,int month);
    public List<HolidayVO> findTaskMember(String task);

}
