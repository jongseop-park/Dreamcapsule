package com.dreamcapsule.project.apps.holiday.service;

import com.dreamcapsule.project.domain.HolidayVO;

import java.util.List;

public interface HolidayService {

    public List<HolidayVO> findBySEQ(int seq);
    public List<HolidayVO> findAll();
    public List<HolidayVO> findByName(String name);
}
