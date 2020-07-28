package com.dreamcapsule.project.apps.holiday.controller;

import com.dreamcapsule.project.apps.holiday.service.HolidayService;
import com.dreamcapsule.project.domain.HolidayVO;
import com.dreamcapsule.project.domain.OvertimeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.View;
import java.util.List;

@Controller
@RequestMapping("")
public class HolidayController {

    @Autowired
    HolidayService holidayService;

    @RequestMapping(value = "/holiday", method = RequestMethod.GET)
    public String home(@RequestParam(value="year", required = false, defaultValue = "1") Long year,@RequestParam(value="selectIndexYear", required = false, defaultValue = "0")Integer selectIndexYear,@RequestParam(value="task", required = false, defaultValue = "0") String task, @RequestParam(value="selectIndexTask", required = false, defaultValue = "0")Integer selectIndexTask,@RequestParam(value="sortingValue", required =  false, defaultValue = "SEQ") String sortingValue,@RequestParam(value="sortingType", required = false, defaultValue = "DESC")String sortingType,Model model) {
        List<HolidayVO> holidayList = holidayService.findAll(sortingValue,sortingType);
        List<HolidayVO> taskList = holidayService.findTask();
        List<HolidayVO> yearList = holidayService.findYear();
        Long[] taskSeq;

        if(year == 1) {
            year = yearList.get(0).getHolidayYear();
        }

        if(task.equals("0")){
            taskSeq = new Long[holidayList.size()];
            for(int i = 0; i < taskSeq.length; i++){
                taskSeq[i] = holidayList.get(i).getSeq();
                model.addAttribute("holidayList", holidayList);
            }
        }else{
            List<HolidayVO> selectedTaskSeq = holidayService.findTaskMember(task);
            taskSeq = new Long[selectedTaskSeq.size()];
            for(int i = 0; i < selectedTaskSeq.size();i++){
                taskSeq[i] = selectedTaskSeq.get(i).getSeq();
                model.addAttribute("holidayList", selectedTaskSeq);
            }
        }

        String[][] use = new String[taskSeq.length][12];
        Long[] useDay = new Long[taskSeq.length];

        for (int x = 1; x <= taskSeq.length; x++) {
            useDay[x - 1] = 0L;
            for (int y = 1; y <= 12; y++) {
                HolidayVO useHoliday = holidayService.findUse(taskSeq[x-1],year, y);
                if (useHoliday != null) {
                    use[x - 1][y - 1] = useHoliday.getUseHoliday().toString();
                    useDay[x - 1] = useDay[x-1] + useHoliday.getUseHoliday();
                } else {
                    use[x - 1][y - 1] = "-";
                }
            }
        }

        model.addAttribute("holidayTask",taskList);
        model.addAttribute("holidayYear",yearList);
        model.addAttribute("holidayUse",use);
        model.addAttribute("selectYear",year);
        model.addAttribute("selectTask",task);
        model.addAttribute("selectIndexYear",selectIndexYear);//select value 값 으로 선택으로 바꾼후 지우기
        model.addAttribute("selectIndexTask",selectIndexTask);
        model.addAttribute("useDay",useDay);
        model.addAttribute("sorting_type",sortingType);
        return "holiday/holiday_total";
    }

    @RequestMapping("/holiday_details")
    public String sub(Model model, @RequestParam("seq") int seq, @RequestParam("year") int year, @RequestParam("month") int month) {
        HolidayVO holidayDetailsInfo = holidayService.findByInfoValue(seq);
        List<HolidayVO> holidayDetails = holidayService.findByValue(seq,year,month);

        model.addAttribute("holidayDetailsInfo",holidayDetailsInfo);
        model.addAttribute("holidayDetails",holidayDetails);

        return "holiday/holiday_details";
    }

    @RequestMapping("/holiday_add")
    public String add(Model model,@RequestParam("seq") int seq,@RequestParam("year") int year) {
        HolidayVO holidayDetails = holidayService.findByInfoValue(seq);
        int useHoliday = holidayService.findUseYear(seq,year);

        model.addAttribute("holidayDetails", holidayDetails);
        model.addAttribute("useHoliday",useHoliday);
        model.addAttribute("year",year);
        return "holiday/holiday_add";
    }

    @RequestMapping("/holiday_insert")
    public String holidayInsert(HttpServletRequest request){
        int userNum = Integer.parseInt(request.getParameter("userNum"));
        String holidayType = request.getParameter("select_type");
        String holidayYear = request.getParameter("year");
        String holidayMonth = request.getParameter("month");
        String holidayDate = request.getParameter("holidayDate");
        String note = request.getParameter("note");
        String useHoliday = request.getParameter("useHoliday");

        holidayService.holidayInsert(userNum,holidayType,holidayYear,holidayMonth,holidayDate,note,useHoliday);

        return "redirect:holiday_details?seq=" + userNum + "&year=" + holidayYear + "&month=" + holidayMonth;
    }

    @RequestMapping("/holiday_update")
    public String detailsUpdate(HttpServletRequest request){
        char state;
        String stateValue = request.getParameter("state");
        if(stateValue.equals("승인")){
            state = 'Y';
        }else{
            state = 'N';
        }
        int seq = Integer.parseInt(request.getParameter("seq"));
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String userNum = request.getParameter("userNum");
        String reply = request.getParameter("spanReply");

        holidayService.detailsUpdate(seq,state,reply);

        return "redirect:holiday_details?seq=" + userNum + "&year=" + year + "&month=" + month;
    }


}