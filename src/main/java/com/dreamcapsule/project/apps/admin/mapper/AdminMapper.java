package com.dreamcapsule.project.apps.admin.mapper;

import com.dreamcapsule.project.domain.AdminVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
@Mapper
public interface AdminMapper {

    public ArrayList<AdminVO> findByUserId(String userId);
    int userSave(AdminVO adminVO);
    int userRoleSave(int userNo,int roleNo);
    int findUserNo( String userId);
    int findRoleNo( String roleName);



}
