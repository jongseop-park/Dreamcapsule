package com.dreamcapsule.project.apps.overtime.mapper;

import com.dreamcapsule.project.apps.overtime.domain.Criteria;
import com.dreamcapsule.project.apps.overtime.domain.OvertimeDomain;
import com.dreamcapsule.project.apps.overtime.domain.OvertimeVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OvertimeMapper {

    // test

    public List<OvertimeDomain> boardList() throws Exception;

    public List<OvertimeDomain> findBno(@Param("bno") int bno);

    public void updateInfo(OvertimeDomain overtimeDomain);

    ///
/*
    @Select("SELECT * FROM OT_MNG_TB")
    public List<OvertimeVO> empList() throws Exception;*/
/*
    @Select("SELECT * from OT_MNG_TB where sequence = ${sequence}")
    public OvertimeVO findInfo(@Param("sequence") int sequence);
*/
/*
    @Update("UPDATE OT_MNG_TB set modifyDate= substr(#{modifyDate}, 1,10) , answer=#{answer},status = #{status} where sequence = #{sequence}")
    public void updateEmpInfo(OvertimeVO overtimeVO);*/

/*
    @Select("select count(*) as totalCount from OT_MNG_TB")
    public int totalCount();
*/
    public int listCount();

    public List<OvertimeVO> listPage(Criteria cri) throws Exception;

    public void updateEmpInfo(OvertimeVO overtimeVO);

    public List<OvertimeVO> empList() throws Exception;

    public OvertimeVO findInfo(@Param("sequence") int sequence);

}
