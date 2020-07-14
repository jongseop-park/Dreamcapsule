package com.dreamcapsule.project.apps.holiday.service.serviceImpl;

import com.dreamcapsule.project.apps.holiday.mapper.HolidayMapper;
import com.dreamcapsule.project.apps.holiday.service.HolidayService;
import com.dreamcapsule.project.domain.HolidayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HolidayServiceImpl implements HolidayService{

    @Autowired
    HolidayMapper holidayMapper;

    @Override
    public List<HolidayVO> findBySEQ(int seq){
        return holidayMapper.findBySEQ(seq);
    }

    @Override
    public List<HolidayVO> findAll(){
        return holidayMapper.findAll();
    }

    @Override
    public List<HolidayVO> findByName(String name){ return holidayMapper.findByName(name);}
}
