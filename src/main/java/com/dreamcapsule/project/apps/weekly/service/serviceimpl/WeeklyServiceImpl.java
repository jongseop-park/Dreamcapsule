package com.dreamcapsule.project.apps.weekly.service.serviceimpl;

import com.dreamcapsule.project.apps.weekly.mapper.WeeklyMapper;
import com.dreamcapsule.project.apps.weekly.service.WeeklyService;
import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.WeeklyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class WeeklyServiceImpl implements WeeklyService {
    @Autowired
    WeeklyMapper weeklyMapper;

    @Override
    public List<WeeklyVO> nameSelect(Criteria cri)  throws Exception{
        return weeklyMapper.nameSelect(cri);
    }

    @Override
    public int listCount(Criteria cri) throws Exception {
        return weeklyMapper.listCount(cri);
    }

    @Override
    public List<WeeklyVO> weeklyXlsDown(Criteria cri) throws Exception {
        return weeklyMapper.weeklyXlsDown(cri);
    }
    //    @Override
//    public List<WeeklyVO> calNameFind(Criteria cri) throws Exception {
//        return weeklyMapper.calNameFind(cri);
//    }
}
