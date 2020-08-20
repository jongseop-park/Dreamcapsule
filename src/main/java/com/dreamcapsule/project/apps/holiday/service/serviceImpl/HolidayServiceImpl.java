package com.dreamcapsule.project.apps.holiday.service.serviceImpl;

import com.dreamcapsule.project.apps.holiday.mapper.HolidayMapper;
import com.dreamcapsule.project.apps.holiday.service.HolidayService;
import com.dreamcapsule.project.domain.HolidayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class HolidayServiceImpl implements HolidayService{

    @Autowired
    HolidayMapper holidayMapper;

    @Override
    public List<HolidayVO> findByValue(int seq,Long year,int month){
        return holidayMapper.findByValue(seq,year,month);
    }

    @Override
    public HolidayVO findByInfoValue(int seq,Long year) { return holidayMapper.findByInfoValue(seq,year);}

    @Override
    public List<HolidayVO> findAll(String sortValue,String sortType,Long year){return holidayMapper.findAll(sortValue,sortType,year); }

    @Override
    public List<HolidayVO> findTask() { return holidayMapper.findTask();}

    @Override
    public List<HolidayVO> findYear() { return holidayMapper.findYear();}

    @Override
    public HolidayVO findUse(Long num,Long year,int month){ return holidayMapper.findUse(num,year,month);}

    @Override
    public List<HolidayVO> findTaskMember(String task,Long year){return holidayMapper.findTaskMember(task,year);}

    @Override
    public void detailsUpdate(int seq,char state,String reply){holidayMapper.detailsUpdate(seq,state,reply);}

    @Override
    public Long findUseYear(int seq,Long year){return holidayMapper.findUseYear(seq,year);}

    @Override
    public void holidayInsert(int userNum,String holidayType,String holidayYear,String holidayMonth,String holidayDate,String note,String useHoliday){holidayMapper.holidayInsert(userNum,holidayType,holidayYear,holidayMonth,holidayDate,note,useHoliday);}

    @Override
    public String[][] holidayMonthUse(Long year,String task,List<HolidayVO> holidayList){
        Long[] taskSeq = matchTaskSeq(task,holidayList,year);
        List<HolidayVO> yearList = holidayMapper.findYear();
        if(year == 1) {
            year = yearList.get(0).getHolidayYear();
        }

        String[][] use = new String[taskSeq.length][12];

        for (int x = 1; x <= taskSeq.length; x++) {
            for (int y = 1; y <= 12; y++) {
                HolidayVO useHoliday = holidayMapper.findUse(taskSeq[x-1],year, y);
                if (useHoliday != null) {
                    use[x - 1][y - 1] = useHoliday.getUseHoliday().toString();
                }
            }
        }
        return use;
    }

    @Override
    public Long[] matchTaskSeq(String task,List<HolidayVO> holidayList,Long year){
        Long[] taskSeq;

        if(task.equals("0")){
            taskSeq = new Long[holidayList.size()];
            for(int i = 0; i < taskSeq.length; i++){
                taskSeq[i] = holidayList.get(i).getSeq();
            }
        }else{
            List<HolidayVO> selectedTaskSeq = holidayMapper.findTaskMember(task,year);
            taskSeq = new Long[selectedTaskSeq.size()];
            for(int i = 0; i < selectedTaskSeq.size();i++){
                taskSeq[i] = selectedTaskSeq.get(i).getSeq();
            }
        }
        return taskSeq;
    }

    @Override
    public Long[] totalUseDay(String task,Long year,List<HolidayVO> holidayList){
        Long[] taskSeq = matchTaskSeq(task,holidayList,year);
        Long[] useDay = new Long[taskSeq.length];
        int seq;
        Long day;
        for (int x = 1; x <= taskSeq.length; x++) {
            seq = taskSeq[x-1].intValue();
            day = holidayMapper.findUseYear(seq,year);
            if(Objects.isNull(day)) {
                useDay[x - 1] = 0L;
            }else{
                useDay[x - 1] = holidayMapper.findUseYear(seq, year);//설정 생성 후 해당 유형 별 휴가 차감일수 곱 하기
            }
        }
        return useDay;
    }

    @Override
    public List<HolidayVO> findUseState(Long year,String sortValue,String sortType){return holidayMapper.findUseState(year,sortValue,sortType);}

}
