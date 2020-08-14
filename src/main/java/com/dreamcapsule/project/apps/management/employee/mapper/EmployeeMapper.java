package com.dreamcapsule.project.apps.management.employee.mapper;

import com.dreamcapsule.project.domain.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Mapper
@Repository
public interface EmployeeMapper {

    public List<EmployeeVO> emplList();
    public List<EmployeeVO> dutylist();
    public List<EmployeeVO> ranklist();
    public List<EmployeeVO> placelist();
    public List<EmployeeVO> authlist();
    public void empUpdate(EmployeeVO employeeVO);
    public EmployeeVO infolist(EmployeeVO employeeVO);
    public void infoUpdate(EmployeeVO employeeVO);
    public void infoDelete(EmployeeVO employeeVO);

}
