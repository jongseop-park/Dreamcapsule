package com.dreamcapsule.project.apps.management.position.service.serviceImpl;

import com.dreamcapsule.project.apps.management.position.mapper.PositionMapper;
import com.dreamcapsule.project.apps.management.position.service.PositionService;
import com.dreamcapsule.project.domain.PositionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionServiceImpl implements PositionService {

    @Autowired
    public PositionMapper positionMapper;

    /*@Override
    public List<PositionVO> findAll(){

        return positionMapper.findAll();
    }*/

    @Override
    public List<PositionVO> page(PositionVO conn){

        return positionMapper.page(conn);
    }

    @Override
    public int listCnt(){

        return positionMapper.listCnt();
    }

    @Override
    public PositionVO findByDetail(PositionVO conn){

        return positionMapper.findByDetail(conn);
    }

    @Override
    public void insert(PositionVO conn){
        positionMapper.insert(conn);
    }

    @Override
    public void delete(PositionVO conn){
        positionMapper.delete(conn);
    }
}
