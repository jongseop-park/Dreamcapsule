package com.dreamcapsule.project.apps.report.mapper;


import com.dreamcapsule.project.apps.report.domain.SearchCriteria;
import com.dreamcapsule.project.domain.ReportVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ReportMapper {
    /* 목록 */
    public List<ReportVO> reportList() throws Exception;

    /* 검색 결과 개수 */
    public int countSearch(SearchCriteria searchCriteria) throws Exception;

    /* 검색 */
    public List<ReportVO> listSearch(SearchCriteria searchCriteria) throws Exception;
}
