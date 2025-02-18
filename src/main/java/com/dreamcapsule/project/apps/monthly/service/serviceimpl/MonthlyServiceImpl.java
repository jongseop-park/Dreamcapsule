package com.dreamcapsule.project.apps.monthly.service.serviceimpl;

import com.dreamcapsule.project.apps.monthly.mapper.MonthlyMapper;
import com.dreamcapsule.project.apps.monthly.service.MonthlyService;
import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.MonthlyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MonthlyServiceImpl implements MonthlyService {
    @Autowired
    MonthlyMapper monthlyMapper;



    @Override
    public List<MonthlyVO> mounthday(Criteria cri) {
        return monthlyMapper.mounthday(cri);
    }

    @Override
    public List<MonthlyVO> monthlyData(Criteria cri) {
        return monthlyMapper.monthlyData(cri);
    }

    @Override
    public int lastdayNum(Criteria cri) {
        return monthlyMapper.lastdayNum(cri);
    }

    @Override
    public List<MonthlyVO> dutyFind() {
        return monthlyMapper.dutyFind();
    }
}
