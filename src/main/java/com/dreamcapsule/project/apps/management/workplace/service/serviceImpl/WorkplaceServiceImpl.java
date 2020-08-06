package com.dreamcapsule.project.apps.management.workplace.service.serviceImpl;

import com.dreamcapsule.project.apps.management.workplace.mapper.WorkplaceMapper;
import com.dreamcapsule.project.apps.management.workplace.service.WorkplaceService;
import com.dreamcapsule.project.domain.EquipmentVO;
import com.dreamcapsule.project.domain.WorkplaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkplaceServiceImpl implements WorkplaceService {

    @Autowired
    public WorkplaceMapper workplaceMapper;

    @Override
    public List<WorkplaceVO> page(WorkplaceVO conn){

        return workplaceMapper.page(conn);
    }

    @Override
    public int listCnt(){

        return workplaceMapper.listCnt();
    }

    @Override
    public WorkplaceVO findByDetail(WorkplaceVO conn){

        return workplaceMapper.findByDetail(conn);
    }

    @Override
    public List<EquipmentVO> beaconList(){

        return workplaceMapper.beaconList();
    }

    @Override
    public List<EquipmentVO> nfcList(){

        return workplaceMapper.nfcList();
    }


}
