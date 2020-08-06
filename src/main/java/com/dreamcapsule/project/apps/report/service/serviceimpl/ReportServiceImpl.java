package com.dreamcapsule.project.apps.report.service.serviceimpl;

import com.dreamcapsule.project.apps.report.domain.SearchCriteria;
import com.dreamcapsule.project.apps.report.mapper.ReportMapper;
import com.dreamcapsule.project.apps.report.service.ReportService;
import com.dreamcapsule.project.domain.ReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    ReportMapper reportMapper;

    /* 목록 */
    @Override
    public List<ReportVO> reportList() throws Exception {
        return reportMapper.reportList();
    }

    /* 검색 결과 개수*/
    @Override
    public int countSearch(SearchCriteria searchCriteria) throws Exception {
        return reportMapper.countSearch(searchCriteria);
    }
    
    /* 검색 결과 */
    @Override
    public List<ReportVO> listSearch(SearchCriteria searchCriteria) throws Exception {
        return reportMapper.listSearch(searchCriteria);
    }

    /* 엑셀 */
    @Override
    public List<ReportVO> reportExcel(SearchCriteria searchCriteria) throws Exception {
        return reportMapper.reportExcel(searchCriteria);
    }
}
