package com.dreamcapsule.project.apps.daily.service.serviceimpl;


import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.DailyDomain;
import com.dreamcapsule.project.apps.daily.mapper.DailyMapper;
import com.dreamcapsule.project.apps.daily.service.DailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class DailyServiceImpl implements DailyService {
    @Autowired
    DailyMapper dailyMapper;

    @Override
    public List<DailyDomain> findAll() {
     //   Log.log("testtttt");

        return dailyMapper.findAll();
    }

    @Override
    public List<DailyDomain> listPage(Criteria cri) throws Exception {
        return dailyMapper.listPage(cri);
    }

    @Override
    public int listCount(Criteria cri) throws Exception {
        return dailyMapper.listCount(cri);
    }

    @Override
    public List<DailyDomain> searchName(Criteria cri) throws Exception {
        return dailyMapper.listPage(cri);
    }
}
