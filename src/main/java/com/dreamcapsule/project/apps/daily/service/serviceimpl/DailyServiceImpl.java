package com.dreamcapsule.project.apps.daily.service.serviceimpl;


import com.dreamcapsule.project.domain.DailyDomain;
import com.dreamcapsule.project.apps.daily.mapper.DailyMapper;
import com.dreamcapsule.project.apps.daily.service.DailyService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springsource.loaded.Log;

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
}
