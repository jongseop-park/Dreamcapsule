package com.dreamcapsule.project.apps.management.employee.service.serviceImpl;

import com.dreamcapsule.project.apps.management.employee.mapper.EmployeeMapper;
import com.dreamcapsule.project.apps.management.employee.service.EmployeeService;
import com.dreamcapsule.project.domain.Criteria;
import com.dreamcapsule.project.domain.EmployeeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public void infoDelete(EmployeeVO employeeVO) {
        employeeMapper.infoDelete(employeeVO);
    }

    @Override
    public void empUpdate(EmployeeVO employeeVO) {
        employeeMapper.empUpdate(employeeVO);
    }

    @Override
    public void infoUpdate(EmployeeVO employeeVO) {
        employeeMapper.infoUpdate(employeeVO);
    }

    @Override
    public EmployeeVO infolist(EmployeeVO employeeVO) {
        return employeeMapper.infolist(employeeVO);
    }

    @Override
    public List<EmployeeVO> authlist() {
        return employeeMapper.authlist();
    }

    @Override
    public List<EmployeeVO> emplList(Criteria criteria) {
        return employeeMapper.emplList(criteria);
    }

    @Override
    public List<EmployeeVO> dutylist() {
        return employeeMapper.dutylist();
    }

    @Override
    public List<EmployeeVO> ranklist() {
        return employeeMapper.ranklist();
    }

    @Override
    public List<EmployeeVO> placelist() {
        return employeeMapper.placelist();
    }

    @Override
    public int empCount(Criteria criteria) {
        return employeeMapper.empCount(criteria);
    }
}
