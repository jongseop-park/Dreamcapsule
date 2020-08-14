package com.dreamcapsule.project.apps.management.employee.service;

import com.dreamcapsule.project.domain.EmployeeVO;

import java.util.ArrayList;
import java.util.List;

public interface EmployeeService {
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
