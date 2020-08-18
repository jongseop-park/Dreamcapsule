package com.dreamcapsule.project.apps.management.workplace.service;

import com.dreamcapsule.project.domain.EquipmentVO;
import com.dreamcapsule.project.domain.WorkplaceVO;

import java.util.List;

public interface WorkplaceService {

    public List<WorkplaceVO> page(WorkplaceVO conn);

    public int listCnt();

    public WorkplaceVO findByDetail(WorkplaceVO conn);

    public List<EquipmentVO> beaconList();

    public List<EquipmentVO> nfcList();

    public void insert(WorkplaceVO conn);

    public void update(WorkplaceVO conn);

    public void delUpdate(WorkplaceVO conn);

    public void delete(WorkplaceVO conn);
}
