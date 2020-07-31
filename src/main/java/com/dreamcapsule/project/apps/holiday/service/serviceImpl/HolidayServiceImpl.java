package com.dreamcapsule.project.apps.holiday.service.serviceImpl;

import com.dreamcapsule.project.apps.holiday.mapper.HolidayMapper;
import com.dreamcapsule.project.apps.holiday.service.HolidayService;
import com.dreamcapsule.project.domain.HolidayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HolidayServiceImpl implements HolidayService{

    @Autowired
    HolidayMapper holidayMapper;

    @Override
    public List<HolidayVO> findByValue(int seq,Long year,int month){
        return holidayMapper.findByValue(seq,year,month);
    }

    @Override
    public HolidayVO findByInfoValue(int seq) { return holidayMapper.findByInfoValue(seq);}

    @Override
    public List<HolidayVO> findAll(String sortValue,String sortType){return holidayMapper.findAll(sortValue,sortType); }

    @Override
    public List<HolidayVO> findTask() { return holidayMapper.findTask();}

    @Override
    public List<HolidayVO> findYear() { return holidayMapper.findYear();}

    @Override
    public HolidayVO findUse(Long num,Long year,int month){ return holidayMapper.findUse(num,year,month);}

    @Override
    public List<HolidayVO> findTaskMember(String task){return holidayMapper.findTaskMember(task);}

    @Override
    public void detailsUpdate(int seq,char state,String reply){holidayMapper.detailsUpdate(seq,state,reply);}

    @Override
    public int findUseYear(int seq,Long year){return holidayMapper.findUseYear(seq,year);}

    @Override
    public void holidayInsert(int userNum,String holidayType,String holidayYear,String holidayMonth,String holidayDate,String note,String useHoliday){holidayMapper.holidayInsert(userNum,holidayType,holidayYear,holidayMonth,holidayDate,note,useHoliday);}

    @Override
    public String[][] holidayMonthUse(Long year,String task,List<HolidayVO> holidayList){
        Long[] taskSeq = matchTaskSeq(task,holidayList);
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
                } else {
                    use[x - 1][y - 1] = "-";
                }
            }
        }

        return use;
    }

    @Override
    public Long[] matchTaskSeq(String task,List<HolidayVO> holidayList){
        Long[] taskSeq;

        if(task.equals("0")){
            taskSeq = new Long[holidayList.size()];
            for(int i = 0; i < taskSeq.length; i++){
                taskSeq[i] = holidayList.get(i).getSeq();
            }
        }else{
            List<HolidayVO> selectedTaskSeq = holidayMapper.findTaskMember(task);
            taskSeq = new Long[selectedTaskSeq.size()];
            for(int i = 0; i < selectedTaskSeq.size();i++){
                taskSeq[i] = selectedTaskSeq.get(i).getSeq();
            }
        }
        return taskSeq;
    }

    @Override
    public Long[] totalUseDay(String task,Long year,List<HolidayVO> holidayList){
        Long[] taskSeq = matchTaskSeq(task,holidayList);
        Long[] useDay = new Long[taskSeq.length];

        for (int x = 1; x <= taskSeq.length; x++) {
            useDay[x - 1] = 0L;
            for (int y = 1; y <= 12; y++) {
                HolidayVO useHoliday = holidayMapper.findUse(taskSeq[x-1],year, y);
                if (useHoliday != null) {
                    useDay[x - 1] = useDay[x-1] + useHoliday.getUseHoliday();
                }
            }
        }
        return useDay;
    }
}
