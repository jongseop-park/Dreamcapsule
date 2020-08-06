package com.dreamcapsule.project.apps.report.service;

import com.dreamcapsule.project.apps.report.domain.SearchCriteria;
import com.dreamcapsule.project.domain.ReportVO;

import java.util.List;

public interface ReportService {
    public List<ReportVO> reportList() throws Exception;
    public int countSearch(SearchCriteria searchCriteria) throws Exception;
    public List<ReportVO> listSearch(SearchCriteria searchCriteria) throws Exception;
    public List<ReportVO> reportExcel(SearchCriteria searchCriteria) throws Exception;
}
