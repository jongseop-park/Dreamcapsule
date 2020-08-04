package com.dreamcapsule.project.apps.outsidejob.mapper;

import com.dreamcapsule.project.domain.OutsidejobVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OutsidejobMapper {
    public List<OutsidejobVO> findAll();
    public List<OutsidejobVO> findInfo();
}
