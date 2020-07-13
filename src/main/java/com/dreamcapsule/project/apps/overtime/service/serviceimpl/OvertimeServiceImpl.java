package com.dreamcapsule.project.apps.overtime.service.serviceimpl;

import com.dreamcapsule.project.apps.overtime.domain.Criteria;
import com.dreamcapsule.project.apps.overtime.domain.OvertimeDomain;
import com.dreamcapsule.project.apps.overtime.domain.OvertimeVO;
import com.dreamcapsule.project.apps.overtime.mapper.OvertimeMapper;
import com.dreamcapsule.project.apps.overtime.service.OvertimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OvertimeServiceImpl implements OvertimeService {
    @Autowired
    OvertimeMapper overtimeMapper;

    @Override
    public List<OvertimeDomain> boardList() throws Exception {
        return overtimeMapper.boardList();
    }
    @Override
    public List<OvertimeDomain> findBno(int bno) throws Exception {
        return overtimeMapper.findBno(bno);
    }
    @Override
    public void updateInfo(OvertimeDomain overtimeDomain) throws Exception {
        overtimeMapper.updateInfo(overtimeDomain);
    }

    /////

    @Override
    public List<OvertimeVO> empList() throws Exception {
        return overtimeMapper.empList();
    }
    @Override
    public OvertimeVO findEmp(int sequence) throws Exception {
        return overtimeMapper.findInfo(sequence);
    }

    @Override
    public void updateEmpInfo(OvertimeVO overtimeVO) throws Exception {
        overtimeMapper.updateEmpInfo(overtimeVO);
    }

    @Override
    public int listCount() throws Exception {
        return overtimeMapper.listCount();
    }

    @Override
    public List<OvertimeVO> listPage(Criteria cri) throws Exception {
        return overtimeMapper.listPage(cri);
    }
}
