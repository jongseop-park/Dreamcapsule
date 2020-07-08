package com.dreamcapsule.project.domain;

public class SampleVO {

    /** 시퀀스(PK) */
    private int seq;

    /** 제목 */
    private String title;

    /** 내용 */
    private String content;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
