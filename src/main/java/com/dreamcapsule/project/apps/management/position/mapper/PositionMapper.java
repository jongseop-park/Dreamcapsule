package com.dreamcapsule.project.apps.management.position.mapper;

import com.dreamcapsule.project.domain.PositionVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PositionMapper {

    /* 전체 조회 */
    /*public List<PositionVO> findAll();*/

    /* 페이징 조회 */
    public List<PositionVO> page(PositionVO conn);

    /* 페이지 목록 */
    public int listCnt();

    /* 상세 조회 */
    public PositionVO findByDetail(PositionVO conn);

    /* 추가 */
    public void insert(PositionVO conn);

    /* 수정 */
    public void update(PositionVO conn);

    /* 삭제 DEL_YN > Y */
    public void delUpdate(PositionVO conn);

    /* 삭제 */
    public void delete(PositionVO conn);

}
