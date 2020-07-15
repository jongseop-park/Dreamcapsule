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
    public void updateEmpInfo(OvertimeVO overtimeVO);

    public List<OvertimeVO> empList() throws Exception;

    public OvertimeVO findInfo(@Param("sequence") int sequence);

    public int listCount();

    public List<OvertimeVO> listPage(Criteria cri) throws Exception;

    public List<OvertimeVO> search(SearchCriteria searchCriteria) throws Exception;

    public int countSearch(SearchCriteria searchCriteria) throws Exception;

}
