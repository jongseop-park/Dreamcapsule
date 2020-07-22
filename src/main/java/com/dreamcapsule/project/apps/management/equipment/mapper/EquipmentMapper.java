package com.dreamcapsule.project.apps.management.equipment.mapper;

import com.dreamcapsule.project.domain.EquipmentVO;
import com.dreamcapsule.project.domain.EquipmentVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface EquipmentMapper {

    /* 페이징 조회 */
    public List<EquipmentVO> page(EquipmentVO conn);

    /* 페이지 목록 */
    public int listCnt();

    /* 상세 조회 */
    public EquipmentVO findByDetail(EquipmentVO conn);

    /* 추가 */
    public void insert(EquipmentVO conn);

    /* 수정 */
    public void update(EquipmentVO conn);

    /* 삭제 DEL_YN > 'Y' */
    public void delUpdate(EquipmentVO conn);

}
