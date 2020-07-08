package com.dreamcapsule.project.apps.sample.mapper;

import com.dreamcapsule.project.domain.SampleVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SampleMapper {

    public List<SampleVO> findAll();
}
