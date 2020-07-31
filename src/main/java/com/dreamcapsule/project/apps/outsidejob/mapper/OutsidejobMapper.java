package com.dreamcapsule.project.apps.outsidejob.mapper;

import com.dreamcapsule.project.domain.OutsideJobCriteria;
import com.dreamcapsule.project.domain.OutsideJobSearchCriteria;
import com.dreamcapsule.project.domain.OutsidejobVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OutsidejobMapper {
    public List<OutsidejobVO> findAllPage(OutsideJobCriteria cri);
    public List<OutsidejobVO> findAll();
    public List<OutsidejobVO> findInfo();
    public int listCount();
    public OutsidejobVO findListSeq(@Param("SEQ") int seq);
    public OutsidejobVO findInfoSeq(@Param("USER_NUM") Long userNum);
    public void detailsUpdate(@Param("STATE") char state,@Param("REPLY")String reply,@Param("SEQ")int seq);
    public List<OutsidejobVO> search(OutsideJobSearchCriteria searchCriteria);
    public int countSearch(OutsideJobSearchCriteria searchCriteria);
}
