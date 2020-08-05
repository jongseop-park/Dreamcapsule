package com.dreamcapsule.project.apps.outsidejob.service;

import com.dreamcapsule.project.apps.outsidejob.domain.OutsideJobCriteria;
import com.dreamcapsule.project.apps.outsidejob.domain.OutsideJobSearchCriteria;
import com.dreamcapsule.project.domain.OutsidejobVO;

import java.util.List;

public interface OutsidejobService {
    public List<OutsidejobVO> findAllPage(OutsideJobSearchCriteria scri);
    public List<OutsidejobVO> findAll();
    public List<OutsidejobVO> findInfo();
    public List<OutsidejobVO> search(OutsideJobSearchCriteria searchCriteria);
    public int countSearch(OutsideJobSearchCriteria searchCriteria);
    public int listCount();
    public OutsidejobVO findListSeq(int seq);
    public OutsidejobVO findInfoSeq(Long userNum);
    public void detailsUpdate(char state,String reply,int seq);
}
