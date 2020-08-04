package com.dreamcapsule.project.apps.outsidejob.service.serviceImpl;

import com.dreamcapsule.project.apps.outsidejob.mapper.OutsidejobMapper;
import com.dreamcapsule.project.apps.outsidejob.service.OutsidejobService;
import com.dreamcapsule.project.domain.OutsidejobVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OutsidejobServiceImpl implements OutsidejobService {
    @Autowired
    OutsidejobMapper outsidejobMapper;

    @Override
    public List<OutsidejobVO> findAll(){return outsidejobMapper.findAll();}

    @Override
    public List<OutsidejobVO> findInfo(){return outsidejobMapper.findInfo();}
}
