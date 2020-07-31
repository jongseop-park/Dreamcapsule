package com.dreamcapsule.project.apps.daily.service;

import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.DailyDomain;

import java.util.List;

public interface DailyService {

    public List<DailyDomain> findAll();

    public List<DailyDomain> listPage(Criteria cri) throws Exception;
    public int listCount(Criteria criteria) throws Exception;
    public List<DailyDomain> detailSearch(Criteria cri) throws Exception;
    public List<DailyDomain> dailyAllList(Criteria cri);
    public void detailUpdate(DailyDomain dailyDomain);
}
