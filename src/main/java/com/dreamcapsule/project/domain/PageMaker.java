package com.dreamcapsule.project.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 10;
    private Criteria cri;

    public void setCri(Criteria cri) {
        this.cri = cri;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }

    public int getTotalCount() {
        return totalCount;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public boolean isNext() {
        return next;
    }

    public int getDisplayPageNum() {
        return displayPageNum;
    }

    public Criteria getCri() {
        return cri;
    }

    private void calcData() {
        endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        prev = startPage == 1 ? false : true;
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
    }


//    public String makeQuery(int page, boolean needSearchType){
//        UriComponentsBuilder uriComponentsBuilder=UriComponentsBuilder.newInstance()
//                .queryParam("page",page)
//                .queryParam("perPageNum",this.cri.getPerPageNum());
//        if(this.cri.getSearchType()!=null){
//            uriComponentsBuilder
//                    .queryParam("searchType",this.cri.getSearchType())
//                    .queryParam("keyword",this.cri.getKeyword());
//        }
//        return uriComponentsBuilder.build().encode().toString();
//    }

//

//=================================================================================================
//=================================페이징 url처리를 위한 메소드========================================
    public String makeQuery(int page) {
        UriComponentsBuilder uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("perPageNum", cri.getPerPageNum());
                    if(this.cri.getKeyword() != null || this.cri.getRegDt() !=null) {
                                uriComponents
                                    .queryParam("keyword", this.cri.getKeyword())
                                    .queryParam("regDt", this.cri.getRegDt());
                        }
                    if(this.cri.getOrderKeyword() != null && this.cri.getOrderMethod() !=null) {
                        uriComponents
                                .queryParam("orderKeyword", this.cri.getOrderKeyword())
                                .queryParam("orderMethod", this.cri.getOrderMethod());
                    }
//        if(this.cri.getKeyword()!=null && this.cri.getRegDt() == null){
//            uriComponents
//
//                    .queryParam("keyword",this.cri.getKeyword());
//        }else if(this.cri.getRegDt() !=null && this.cri.getKeyword()==null){
//            uriComponents
//
//                    .queryParam("regDt",this.cri.getRegDt());
//        }else if(this.cri.getRegDt() !=null && this.cri.getKeyword() != null){
//            uriComponents
//                    .queryParam("keyword",this.cri.getKeyword())
//            .queryParam("regDt",this.cri.getRegDt());
//        }

        return uriComponents.build().encode().toString();
    }

//================================================================================================
//=================================Weekly 페이징==================================================
    public String weekmakeQuery(int page) {
        UriComponentsBuilder uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("perPageNum", cri.getPerPageNum());

//
//        if(this.cri.getKeyword()!=null && (this.cri.getRegDt() == null && this.cri.getEndDate() == null) ){
//            uriComponents
//                    .queryParam("keyword",this.cri.getKeyword());
//        }


        if((this.cri.getRegDt() != null && this.cri.getEndDate() != null)  && this.cri.getKeyword()!=null){
            uriComponents

                    .queryParam("startDate",this.cri.getStartDate())
                    .queryParam("endDate",this.cri.getEndDate())
                    .queryParam("keyword",this.cri.getKeyword());

        }
        if(this.cri.getOrderKeyword() != null && this.cri.getOrderMethod() !=null) {
            uriComponents
                    .queryParam("orderKeyword", this.cri.getOrderKeyword())
                    .queryParam("orderMethod", this.cri.getOrderMethod());
        }
        return uriComponents.build().encode().toString();
    }
//=================================================================================================
//=================================직원 관리 페이징==================================================
public String empmakeQuery(int page) {
    UriComponentsBuilder uriComponents =
            UriComponentsBuilder.newInstance()
                    .queryParam("page", page)
                    .queryParam("perPageNum", cri.getPerPageNum());
    if (this.cri.getKeyword() != null || this.cri.getRegDt() != null) {
        uriComponents
                .queryParam("keyword", this.cri.getKeyword());

    }
    if (this.cri.getOrderKeyword() != null && this.cri.getOrderMethod() != null) {
        uriComponents
                .queryParam("orderKeyword", this.cri.getEorderKeyword())
                .queryParam("orderMethod", this.cri.getOrderMethod());
    }
    return uriComponents.build().encode().toString();
}
    

}
