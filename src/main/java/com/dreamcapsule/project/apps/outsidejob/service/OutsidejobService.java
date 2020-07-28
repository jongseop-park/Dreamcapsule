package com.dreamcapsule.project.apps.outsidejob.service;

import com.dreamcapsule.project.domain.OutsidejobVO;

import java.util.List;

public interface OutsidejobService {
    public List<OutsidejobVO> findAll();
    public List<OutsidejobVO> findInfo();
}
