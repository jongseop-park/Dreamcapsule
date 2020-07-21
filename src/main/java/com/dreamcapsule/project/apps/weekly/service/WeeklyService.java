package com.dreamcapsule.project.apps.weekly.service;

import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.WeeklyVO;
import org.springframework.stereotype.Service;

import java.util.List;

public interface WeeklyService {
    public List<WeeklyVO> nameSelect(Criteria cri)  throws Exception;
    public int listCount(Criteria cri) throws Exception;
//    public List<WeeklyVO> calNameFind(Criteria cri) throws Exception;
}
