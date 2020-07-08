package com.example.board.apps.daliy.service.serviceimpl;


import com.example.board.apps.daliy.domain.DailyDomain;
import com.example.board.apps.daliy.mapper.DailyMapper;
import com.example.board.apps.daliy.service.DailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DailyServiceImpl implements DailyService {

    @Autowired
    DailyMapper dailyMapper;

    @Override
    public List<DailyDomain> findByBno(int bno) {
        return dailyMapper.findByBno(bno);
    }

    @Override
    public void insert(DailyDomain daily) {
            dailyMapper.insert(daily);
    }

    @Override
    public void update(DailyDomain daily) {
            dailyMapper.update(daily);
    }

    @Override
    public void delete(int bno) {
            dailyMapper.delete(bno);
    }
}
