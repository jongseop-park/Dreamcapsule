package com.dreamcapsule.project.apps.admin.mapper;

import com.dreamcapsule.project.domain.AdminVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AdminMapper {

    public AdminVO read(String id);
}
