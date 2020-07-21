package com.dreamcapsule.project.apps.holiday.mapper;

import com.dreamcapsule.project.domain.HolidayVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface HolidayMapper {

    public List<HolidayVO> findByValue(@Param("SEQ") int SEQ,@Param("YEAR") int year,@Param("MONTH") int month);

    public HolidayVO findByInfoValue(@Param("SEQ") int SEQ);

    public List<HolidayVO> findAll(@Param("VALUE") String sortValue,@Param("TYPE")String sortType);

    public List<HolidayVO> findByName(@Param("NAME") String NAME);

    public List<HolidayVO> findTask();

    public List<HolidayVO> findYear();

    public HolidayVO findUse(@Param("NUM") Long num, @Param("YEAR") Long year, @Param("MONTH") int month);

    public List<HolidayVO> findTaskMember(@Param("TASK") String task);
}
