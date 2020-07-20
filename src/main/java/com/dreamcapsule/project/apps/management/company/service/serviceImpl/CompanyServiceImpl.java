package com.dreamcapsule.project.apps.management.company.service.serviceImpl;

import com.dreamcapsule.project.apps.management.company.mapper.CompanyMapper;
import com.dreamcapsule.project.apps.management.company.service.CompanyService;
import com.dreamcapsule.project.domain.CompanyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    public CompanyMapper companyMapper;

    /* 페이징 */
    @Override
    public List<CompanyVO> page(CompanyVO conn){
        return companyMapper.page(conn);
    }

    /* 페이지 목록 */
    @Override
    public int listCnt(){
        return companyMapper.listCnt();
    }

    /* 상세 조회 */
    @Override
    public CompanyVO findByDetail(CompanyVO conn){
        return companyMapper.findByDetail(conn);
    }

    /* 추가 */
    @Override
    public void insert(CompanyVO conn){
        companyMapper.insert(conn);
    }

    /* 수정 */
    @Override
    public void update(CompanyVO conn){
        companyMapper.update(conn);
    }

    /* 삭제 DEL_YN > 'Y' */
    @Override
    public void delUpdate(CompanyVO conn){
        companyMapper.delUpdate(conn);
    }
}
