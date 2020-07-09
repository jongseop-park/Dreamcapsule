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

    @Select("SELECT * FROM HOLIDAYTEST WHERE SEQ = #{SEQ}")
    public List<HolidayVO> findBySEQ(@Param("SEQ") int SEQ);

    public List<HolidayVO> findAll();
}
