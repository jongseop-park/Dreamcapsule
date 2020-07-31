package com.dreamcapsule.project.apps.outsidejob.service.serviceImpl;

import com.dreamcapsule.project.apps.outsidejob.mapper.OutsidejobMapper;
import com.dreamcapsule.project.apps.outsidejob.service.OutsidejobService;
import com.dreamcapsule.project.domain.HolidayVO;
import com.dreamcapsule.project.domain.OutsideJobCriteria;
import com.dreamcapsule.project.domain.OutsideJobSearchCriteria;
import com.dreamcapsule.project.domain.OutsidejobVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OutsidejobServiceImpl implements OutsidejobService {
    @Autowired
    OutsidejobMapper outsidejobMapper;

    @Override
    public List<OutsidejobVO> findAllPage(OutsideJobCriteria cri){return outsidejobMapper.findAllPage(cri);}

    @Override
    public List<OutsidejobVO> findAll(){return outsidejobMapper.findAll();}

    @Override
    public List<OutsidejobVO> findInfo(){return outsidejobMapper.findInfo();}

    @Override
    public int listCount(){return outsidejobMapper.listCount();}

    @Override
    public OutsidejobVO findListSeq(int seq){return outsidejobMapper.findListSeq(seq);}

    @Override
    public OutsidejobVO findInfoSeq(Long seq){return outsidejobMapper.findInfoSeq(seq);}

    @Override
    public void detailsUpdate(char state,String reply,int seq){outsidejobMapper.detailsUpdate(state,reply,seq);}

    @Override
    public List<OutsidejobVO> search(OutsideJobSearchCriteria searchCriteria){return outsidejobMapper.search(searchCriteria);}

    @Override
    public int countSearch(OutsideJobSearchCriteria searchCriteria){return outsidejobMapper.countSearch(searchCriteria);}
}
