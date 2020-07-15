package com.dreamcapsule.project.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
//페이징 처리를 위한 멤버------------------------------------------------------------------------------------------
    private int page;
    private int perPageNum;
    private int rowStart;
    private int rowEnd;
//검색 기능을 위한 멤버--------------------------------------------------------------------------------------------
    private String regDt;
    private String keyword;
//-------------------------------------------------------------------------------------------------------------

    public Criteria(){
        this.page=1;
        this.perPageNum =10;

    }

    public void setPage(int page){
        if(page <= 0){
            this.page = 1;
            return;
        }
        this.page = page;
    }


    public void setPerPageNum(int perPageNum) {
        if (perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 10;
            return;
        }
        this.perPageNum = perPageNum;
    }

    public int getPage() {
        return page;
    }

    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }

    public int getPerPageNum() {
        return this.perPageNum;
    }

    public int getRowStart() {
        rowStart = ((page - 1) * perPageNum) + 1;
        return rowStart;
    }

    public int getRowEnd() {
        rowEnd = rowStart + perPageNum - 1;
        return rowEnd;
    }


    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getRegDt() {
        return regDt;
    }

    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }

    @Override
    public String toString() {
        return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
                + "]";
    }

    public String makeQuery(int page){
        UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
                .queryParam("page",page)
                .queryParam("perPageNum", this.getPerPageNum());
        if(keyword!=null && regDt == null){
            uriComponentsBuilder

                    .queryParam("keyword",this.keyword);
        }else if(keyword==null && regDt != null){
            uriComponentsBuilder

                    .queryParam("regDt",this.regDt);
        }
        return uriComponentsBuilder.build().encode().toString();
    }




}
