package com.dreamcapsule.project.apps.management.equipment.service;

import com.dreamcapsule.project.domain.EquipmentVO;

import java.util.List;

public interface EquipmentService {

    public List<EquipmentVO> page(EquipmentVO conn);

    public int listCnt();

    public EquipmentVO findByDetail(EquipmentVO conn);

    public void insert(EquipmentVO conn);

    public void update(EquipmentVO conn);

    public void delUpdate(EquipmentVO conn);
}
