package com.dreamcapsule.project.apps.management.company.service;

import com.dreamcapsule.project.domain.CompanyVO;

import java.util.List;

public interface CompanyService {

    public List<CompanyVO> page(CompanyVO conn);

    public int listCnt();

    public CompanyVO findByDetail(CompanyVO conn);

    public void insert(CompanyVO conn);

    public void update(CompanyVO conn);

    public void delUpdate(CompanyVO conn);
}
