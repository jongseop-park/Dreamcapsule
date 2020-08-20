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

    public List<HolidayVO> findByValue(@Param("SEQ") int SEQ,@Param("YEAR") Long year,@Param("MONTH") int month);

    public HolidayVO findByInfoValue(@Param("SEQ") int SEQ,@Param("YEAR") Long year);

    public List<HolidayVO> findAll(@Param("VALUE") String sortValue,@Param("TYPE")String sortType,@Param("YEAR")Long year);

    public List<HolidayVO> findTask();

    public List<HolidayVO> findYear();

    public HolidayVO findUse(@Param("NUM") Long num, @Param("YEAR") Long year, @Param("MONTH") int month);

    public List<HolidayVO> findTaskMember(@Param("TASK") String task,@Param("YEAR")Long year);

    public void detailsUpdate(@Param("SEQ") int seq,@Param("STATE") char state,@Param("REPLY") String reply);

    public Long findUseYear(@Param("SEQ") int seq,@Param("YEAR") Long year);

    public void holidayInsert(@Param("USER_NUM")int userNum,@Param("HOLIDAY_TYPE") String holidayType,@Param("HOLIDAY_YEAR") String holidayYear,@Param("HOLIDAY_MONTH") String holidayMonth,@Param("HOLIDAY_DATE") String holidayDate,@Param("NOTE") String note,@Param("USE_HOLIDAY") String useHoliday);

    public List<HolidayVO> findUseState(@Param("YEAR")Long year,@Param("VALUE") String sortValue,@Param("TYPE") String sortType);
}
