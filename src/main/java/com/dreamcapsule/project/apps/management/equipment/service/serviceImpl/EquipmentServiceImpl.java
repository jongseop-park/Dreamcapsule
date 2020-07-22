package com.dreamcapsule.project.apps.management.equipment.service.serviceImpl;

import com.dreamcapsule.project.apps.management.equipment.mapper.EquipmentMapper;
import com.dreamcapsule.project.apps.management.equipment.service.EquipmentService;
import com.dreamcapsule.project.domain.EquipmentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentServiceImpl implements EquipmentService {

    @Autowired
    public EquipmentMapper equipmentMapper;

    /* 페이징 */
    @Override
    public List<EquipmentVO> page(EquipmentVO conn){
        return equipmentMapper.page(conn);
    }

    /* 페이지 목록 */
    @Override
    public int listCnt(){
        return equipmentMapper.listCnt();
    }

    /* 상세 조회 */
    @Override
    public EquipmentVO findByDetail(EquipmentVO conn){
        return equipmentMapper.findByDetail(conn);
    }

    /* 추가 */
    @Override
    public void insert(EquipmentVO conn){
        equipmentMapper.insert(conn);
    }

    /* 수정 */
    @Override
    public void update(EquipmentVO conn){
        equipmentMapper.update(conn);
    }

    /* 삭제 DEL_YN > 'Y' */
    @Override
    public void delUpdate(EquipmentVO conn){
        equipmentMapper.delUpdate(conn);
    }
}
