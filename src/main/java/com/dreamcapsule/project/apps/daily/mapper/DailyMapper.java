package com.dreamcapsule.project.apps.daily.mapper;


import com.dreamcapsule.project.domain.DailyDomain;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository

public interface DailyMapper {


    @Select("select * from comm_tb")
    public List<DailyDomain> findAll();

}
