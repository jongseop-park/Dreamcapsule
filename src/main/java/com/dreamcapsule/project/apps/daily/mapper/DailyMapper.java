package com.dreamcapsule.project.apps.daily.mapper;


import com.dreamcapsule.project.domain.DailyDomain;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository

public interface DailyMapper {


    @Select("select EMPL_NM ,DUTY_ID ,RANK_ID , ONW_TI ,OFFW_TI ,WORK_ST ,WORK_TI ,REST_TI ,WORK_PL ,WORK_AD ,TOTAL_TI ," +
            "TARDY_CT ,ABTI_CT ,to_char(REG_DT ,'yyyymmdd')from comm_tb")
    public List<DailyDomain> findAll();

}
