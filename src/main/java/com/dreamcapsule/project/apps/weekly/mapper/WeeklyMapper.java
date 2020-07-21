package com.dreamcapsule.project.apps.weekly.mapper;

import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.WeeklyVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository
public interface WeeklyMapper {

    public List<WeeklyVO> nameSelect(Criteria cri)  throws Exception;

    public int listCount(Criteria cri) throws Exception;
//    public List<WeeklyVO> calNameFind(Criteria cri) throws Exception;
}
