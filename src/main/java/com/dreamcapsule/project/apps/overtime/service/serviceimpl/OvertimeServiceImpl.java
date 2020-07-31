package com.dreamcapsule.project.apps.overtime.service.serviceimpl;

import com.dreamcapsule.project.apps.overtime.domain.Criteria;
import com.dreamcapsule.project.domain.OvertimeVO;
import com.dreamcapsule.project.apps.overtime.domain.SearchCriteria;
import com.dreamcapsule.project.apps.overtime.mapper.OvertimeMapper;
import com.dreamcapsule.project.apps.overtime.service.OvertimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OvertimeServiceImpl implements OvertimeService {
    @Autowired
    OvertimeMapper overtimeMapper;

    /* 정보 조회*/
    @Override
    public OvertimeVO findEmp(int sequence) throws Exception {
        return overtimeMapper.findInfo(sequence);
    }

    /* 수정 */
    @Override
    public void updateEmpInfo(OvertimeVO overtimeVO) throws Exception {
        overtimeMapper.updateEmpInfo(overtimeVO);
    }

    /* 검색 */
    @Override
    public List<OvertimeVO> listSearch(SearchCriteria searchCriteria) throws Exception {
        return overtimeMapper.search(searchCriteria);
    }

    /* 검색 결과 개수 */
    @Override
    public int countSearch(SearchCriteria searchCriteria) throws Exception {
        return overtimeMapper.countSearch(searchCriteria);
    }

    /* 목록 */
    @Override
    public List<OvertimeVO> overtimeList() throws Exception {
        return overtimeMapper.overtimeList();
    }

    /* 엑셀 */
    @Override
    public List<OvertimeVO> overtimeExcel(SearchCriteria searchCriteria) throws Exception {
        return overtimeMapper.overtimeExcel(searchCriteria);
    }
}
