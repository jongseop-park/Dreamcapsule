package com.example.board.apps.daliy.service;

import com.example.board.apps.daliy.domain.DailyDomain;

import java.util.List;

public interface DailyService {

    public List<DailyDomain> findByBno(int bno);
    public void insert(DailyDomain daily);
    public void update(DailyDomain daily);
    public void delete(int bno);


}
