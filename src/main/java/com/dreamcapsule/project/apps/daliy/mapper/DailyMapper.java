package com.dreamcapsule.project.apps.daliy.mapper;

import com.dreamcapsule.project.apps.daliy.domain.DailyDomain;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DailyMapper {

    @Select("SELECT * FROM BOARD WHERE BNO = #{bno}")
            public List<DailyDomain> findByBno(@Param("bno")int bno);

    @Insert("INSERT INTO board(userName, content) VALUES(#{userName}, #{content}, #{contents})")
    public void insert(DailyDomain daily);

    @Update("UPDATE board SET contents=#{contents} where bno=#{bno}")
    public void update(DailyDomain daily);

    @Delete("DELETE FROM board WHERE bno=#{bno}")
    public void delete(@Param("bno")int bno);





}

