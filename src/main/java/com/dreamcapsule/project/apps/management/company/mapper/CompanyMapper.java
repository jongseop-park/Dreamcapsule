package com.dreamcapsule.project.apps.management.company.mapper;

import com.dreamcapsule.project.domain.CompanyVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CompanyMapper {

    /* 페이징 조회 */
    public List<CompanyVO> page(CompanyVO conn);

    /* 페이지 목록 */
    public int listCnt();

    /* 상세 조회 */
    public CompanyVO findByDetail(CompanyVO conn);

    /* 추가 */
    public void insert(CompanyVO conn);

    /* 수정 */
    public void update(CompanyVO conn);

    /* 삭제 DEL_YN > 'Y' */
    public void delUpdate(CompanyVO conn);

}
