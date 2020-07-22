package com.dreamcapsule.project.apps.management.workplace.service.serviceImpl;

import com.dreamcapsule.project.apps.management.workplace.mapper.WorkplaceMapper;
import com.dreamcapsule.project.apps.management.workplace.service.WorkplaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkplaceServiceImpl implements WorkplaceService {

    @Autowired
    public WorkplaceMapper workplaceMapper;


}
