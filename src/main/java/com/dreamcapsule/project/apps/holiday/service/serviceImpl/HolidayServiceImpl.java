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
    public List<HolidayVO> findByValue(int seq,int year,int month){
        return holidayMapper.findByValue(seq,year,month);
    }

    @Override
    public HolidayVO findByInfoValue(int seq) { return holidayMapper.findByInfoValue(seq);}
    @Override
    public List<HolidayVO> findAll(String sortValue,String sortType){
        return holidayMapper.findAll(sortValue,sortType);
    }

    @Override
    public List<HolidayVO> findByName(String name){ return holidayMapper.findByName(name);}

    @Override
    public List<HolidayVO> findTask() { return holidayMapper.findTask();}

    @Override
    public List<HolidayVO> findYear() { return holidayMapper.findYear();}

    @Override
    public HolidayVO findUse(Long num,Long year,int month){ return holidayMapper.findUse(num,year,month);}

    @Override
    public List<HolidayVO> findTaskMember(String task){return holidayMapper.findTaskMember(task);}

}
