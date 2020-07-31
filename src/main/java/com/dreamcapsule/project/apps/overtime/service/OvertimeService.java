package com.dreamcapsule.project.apps.overtime.service;

import com.dreamcapsule.project.apps.overtime.domain.Criteria;
import com.dreamcapsule.project.domain.OvertimeVO;
import com.dreamcapsule.project.apps.overtime.domain.SearchCriteria;

import java.util.List;

public interface OvertimeService {
    public OvertimeVO findEmp(int sequence) throws Exception;

    public void updateEmpInfo(OvertimeVO overtimeVO) throws Exception;

    public List<OvertimeVO> listSearch(SearchCriteria searchCriteria) throws Exception;

    public int countSearch(SearchCriteria searchCriteria) throws Exception;

    public List<OvertimeVO> overtimeList() throws Exception;

    public List<OvertimeVO> overtimeExcel(SearchCriteria searchCriteria) throws Exception;
}
