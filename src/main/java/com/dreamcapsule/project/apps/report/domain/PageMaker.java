package com.dreamcapsule.project.apps.report.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PageMaker {

    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int totalPage;

    public int getTotalPage() {
        totalPage = totalCount/ displayPageNum;

        if(totalCount > totalPage * displayPageNum)
            totalPage++;

        return totalPage;
    }


    private int displayPageNum = 10;

    private com.dreamcapsule.project.apps.report.domain.Criteria cri;

    public void setCri(com.dreamcapsule.project.apps.report.domain.Criteria cri) {
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
        if(endPage > totalCount)
            endPage = totalCount;

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
        if (endPage > tempEndPage)
        {
            endPage = tempEndPage;
        }
        prev = startPage == 1 ? false : true;
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
    }

    public String makeSearch(int page) {
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("keyword", encoding(((com.dreamcapsule.project.apps.report.domain.SearchCriteria)cri).getKeyword()))
                .queryParam("startDate", ((SearchCriteria) cri).getStartDate())
                .queryParam("endDate", ((SearchCriteria) cri).getEndDate())
                .queryParam("orderKeyword", ((SearchCriteria) cri).getOrderKeyword())
                .queryParam("order", ((SearchCriteria) cri).getOrder())
                .build();
        return uriComponents.toUriString();
    }

    private String encoding(String keyword) {
        if(keyword == null || keyword.trim().length() ==0 )
        {
            return "";
        }
        try {
            return URLEncoder.encode(keyword, "UTF-8");
        } catch(UnsupportedEncodingException e) {
            return "";
        }
    }

}
