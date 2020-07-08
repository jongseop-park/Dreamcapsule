package com.dreamcapsule.project.apps.sample.service.serviceImpl;

import com.dreamcapsule.project.apps.sample.mapper.SampleMapper;
import com.dreamcapsule.project.apps.sample.service.SampleService;
import com.dreamcapsule.project.domain.SampleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SampleServiceImpl implements SampleService {

    @Autowired
    SampleMapper sampleMapper;

    @Override
    public List<SampleVO> findAll() {
        return sampleMapper.findAll();
    }

}
