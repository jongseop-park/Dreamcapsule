package com.dreamcapsule.project.domain;

public class OutsideJobSearchCriteria extends OutsideJobCriteria{
    private String keyword = "";
    private String sortKeyword = "";
    private String sort = "";

    public String getKeyword() {
        if(keyword.equals(null)) {
            return "";
        }
            return keyword;
    }

    public void setKeyword(String keyword){
        this.keyword = keyword;
    }

    public String getSortKeyword() {
        if(sortKeyword.equals("")){
            return "seq";
        }
        return sortKeyword;
    }

    public void setSortKeyword(String sortKeyword){this.sortKeyword = sortKeyword;}

    public String getSort(){
        return sort;
    }

    public void setSort(String sort){this.sort = sort;}

    @Override
    public String toString(){
        return "OutsideJobSearchCriteria [keyword=" + keyword + "]";
    }
}
