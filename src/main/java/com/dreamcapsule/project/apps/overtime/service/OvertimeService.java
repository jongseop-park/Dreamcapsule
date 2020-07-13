package com.dreamcapsule.project.apps.overtime.service;

import com.dreamcapsule.project.apps.overtime.domain.Criteria;
import com.dreamcapsule.project.apps.overtime.domain.OvertimeDomain;
import com.dreamcapsule.project.apps.overtime.domain.OvertimeVO;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface OvertimeService {
    public List<OvertimeDomain> boardList() throws Exception;
    public List<OvertimeDomain> findBno(int bno) throws Exception;
    public void updateInfo(OvertimeDomain overtimeDomain) throws Exception;

    ////

    public List<OvertimeVO> empList() throws Exception;
    public OvertimeVO findEmp(int sequence) throws Exception;
    public void updateEmpInfo(OvertimeVO overtimeVO) throws Exception;
    public int listCount() throws Exception;

    public List<OvertimeVO> listPage(Criteria cri) throws Exception;

}
