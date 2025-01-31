package com.dreamcapsule.project.apps.monthly.mapper;

import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.MonthlyVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MonthlyMapper {

    public List<MonthlyVO> mounthday (Criteria cri);
    public List<MonthlyVO> monthlyData(Criteria cri);
    public int lastdayNum(Criteria cri);
    public List<MonthlyVO> dutyFind();

}
