package com.dreamcapsule.project.apps.monthly.service;


import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.MonthlyVO;

import java.util.List;

public interface MonthlyService {

    public List<MonthlyVO> mounthday (Criteria cri);
    public List<MonthlyVO> monthlyData(Criteria cri);
    public int lastdayNum(Criteria cri);
    public List<MonthlyVO> dutyFind();

}
