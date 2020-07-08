package com.example.board.apps.daliy.domain;

public class DailyDomain {

    private int bno;
    private String userName;
    private String content;

    public int getBno(){
        return bno;

    }

    public void setBno(int bno){
        this.bno = bno;
    }

    public String getUserName(){
        return userName;
    }
    public void setUserName(String userName){
        this.userName=userName;

    }
    public String getContents(){
        return content;

    }
    public void setContents(String contents){
        this.content=contents;
    }


}
