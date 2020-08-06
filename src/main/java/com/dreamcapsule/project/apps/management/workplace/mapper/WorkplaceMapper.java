package com.dreamcapsule.project.apps.management.workplace.mapper;

import com.dreamcapsule.project.domain.EquipmentVO;
import com.dreamcapsule.project.domain.WorkplaceVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface WorkplaceMapper {

    public List<WorkplaceVO> page(WorkplaceVO conn);

    public int listCnt();

    public WorkplaceVO findByDetail(WorkplaceVO conn);

    public List<EquipmentVO> beaconList();

    public List<EquipmentVO> nfcList();
}
