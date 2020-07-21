package com.dreamcapsule.project.domain;

import java.util.List;

public class HolidayDetailsVO {
    private List<HolidayVO> data;

    private int num;

    public HolidayVO getData(){return data.get(num);}

    public void setData(List<HolidayVO> data){this.data = data;}

    public int getNum(){return num;}

    public void setNum(int num){this.num = num;}
}
