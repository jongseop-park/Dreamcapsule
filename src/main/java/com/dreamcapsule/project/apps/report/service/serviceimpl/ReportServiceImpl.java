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


    @Override
    public List<ReportVO> reportList() throws Exception {
        return reportMapper.reportList();
    }

    @Override
    public int countSearch(SearchCriteria searchCriteria) throws Exception {
        return reportMapper.countSearch(searchCriteria);
    }

    @Override
    public List<ReportVO> listSearch(SearchCriteria searchCriteria) throws Exception {
        return reportMapper.listSearch(searchCriteria);
    }
}
