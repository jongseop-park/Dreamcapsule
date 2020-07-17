package com.dreamcapsule.project.apps.management.position.service;

import com.dreamcapsule.project.domain.PositionVO;

import java.util.List;

public interface PositionService {

    /*public List<PositionVO> findAll();*/

    public List<PositionVO> page(PositionVO conn);

    public int listCnt ();

    public PositionVO findByDetail(PositionVO conn);

    public void insert(PositionVO conn);

    public void update(PositionVO conn);

    public void delUpdate(PositionVO conn);

    public void delete(PositionVO conn);
}
