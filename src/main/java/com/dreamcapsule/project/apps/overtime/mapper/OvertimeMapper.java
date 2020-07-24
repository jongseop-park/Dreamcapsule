package com.dreamcapsule.project.apps.overtime.mapper;

import com.dreamcapsule.project.apps.overtime.domain.Criteria;
import com.dreamcapsule.project.domain.OvertimeVO;
import com.dreamcapsule.project.apps.overtime.domain.SearchCriteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OvertimeMapper {

    /* 정보 조회 */
    public OvertimeVO findInfo(@Param("sequence") int sequence);

    /* 정보 수정 */
    public void updateEmpInfo(OvertimeVO overtimeVO);

    /* 검색 */
    public List<OvertimeVO> search(SearchCriteria searchCriteria) throws Exception;

    /* 검색 결과 개수 */
    public int countSearch(SearchCriteria searchCriteria) throws Exception;

    /* 목록 */
    public List<OvertimeVO> overtimeList() throws Exception;

}
