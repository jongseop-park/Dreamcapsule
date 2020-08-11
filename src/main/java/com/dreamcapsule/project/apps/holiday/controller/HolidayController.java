package com.dreamcapsule.project.apps.holiday.controller;

import com.dreamcapsule.project.apps.holiday.domain.Criteria;
import com.dreamcapsule.project.apps.holiday.service.HolidayService;
import com.dreamcapsule.project.domain.HolidayVO;
import com.dreamcapsule.project.domain.OvertimeVO;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.View;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class HolidayController {

    @Autowired
    HolidayService holidayService;

    @RequestMapping(value = "/holiday", method = RequestMethod.GET)
    public String home(@ModelAttribute("cri")Criteria criteria, Model model) {
        List<HolidayVO> holidayList = holidayService.findAll(criteria.getSortingValue(),criteria.getSortingType(),criteria.getYear());
        List<HolidayVO> taskList = holidayService.findTask();
        List<HolidayVO> yearList = holidayService.findYear();

        if(criteria.getTask().equals("0")){
                model.addAttribute("holidayList", holidayList);
        }else{
                model.addAttribute("holidayList", holidayService.findTaskMember(criteria.getTask(),criteria.getYear()));
        }

        model.addAttribute("holidayTask",taskList);
        model.addAttribute("holidayYear",yearList);
        model.addAttribute("holidayUse",holidayService.holidayMonthUse(criteria.getYear(),criteria.getTask(),holidayList));
        model.addAttribute("useDay",holidayService.totalUseDay(criteria.getTask(),criteria.getYear(),holidayList));
        model.addAttribute("cri",criteria);

        return "holiday/holiday_total";
    }

    @RequestMapping("/holiday_details")
    public String sub(Model model, @ModelAttribute("cri")Criteria criteria) {
        HolidayVO holidayDetailsInfo = holidayService.findByInfoValue(criteria.getSeq(),criteria.getYear());
        List<HolidayVO> holidayDetails = holidayService.findByValue(criteria.getSeq(),criteria.getYear(),criteria.getMonth());

        model.addAttribute("holidayDetailsInfo",holidayDetailsInfo);
        model.addAttribute("holidayDetails",holidayDetails);

        return "holiday/holiday_details";
    }

    @RequestMapping("/holiday_add")
    public String add(Model model,@ModelAttribute("cri")Criteria criteria) {
        HolidayVO holidayDetails = holidayService.findByInfoValue(criteria.getSeq(),criteria.getYear());
        Long useHoliday = holidayService.findUseYear(criteria.getSeq(),criteria.getYear());

        model.addAttribute("holidayDetails", holidayDetails);
        model.addAttribute("useHoliday",useHoliday);
        model.addAttribute("year",criteria.getYear());
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

    @RequestMapping("/holidayExcelDown.do")
    public void holidayExcelDown(HttpServletResponse response,@ModelAttribute("cri")Criteria criteria) throws Exception{
    //뷰 부분 분리해서 사용하기
        List<HolidayVO> holidayList = holidayService.findAll(criteria.getSortingValue(),criteria.getSortingType(),criteria.getYear());
        Long[] taskSeq = holidayService.matchTaskSeq(criteria.getTask(),holidayList,criteria.getYear());

        String[][] use = holidayService.holidayMonthUse(criteria.getYear(),criteria.getTask(),holidayList);
        Long[] useDay = holidayService.totalUseDay(criteria.getTask(),criteria.getYear(),holidayList);

        Workbook wd = new HSSFWorkbook();
        Sheet sheet = wd.createSheet("휴가 관리");
        Row row = null;
        Cell cell = null;
        int rowNo = 0;
        final int columnNum = 16;

        String[] columnNames = {"직원", "직무", "직급", "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월", "사용 휴가"};

        row = sheet.createRow(rowNo++);
        for(int x = 0; x < columnNum;x++){
            cell = row.createCell(x);
            cell.setCellValue(columnNames[x]);
        }

        for(int x = 0; x < taskSeq.length;x++){
            int y = 0;
            row = sheet.createRow(rowNo++);
            cell = row.createCell(y++);
            cell.setCellValue(holidayList.get(x).getName());
            cell = row.createCell(y++);
            cell.setCellValue(holidayList.get(x).getTask());
            cell = row.createCell(y++);
            cell.setCellValue(holidayList.get(x).getJobGrade());
            for(int z = 0; y < 15;y++){
                cell = row.createCell(y);
                cell.setCellValue(use[x][z++]);
            }
            cell = row.createCell(y++);
            cell.setCellValue(useDay[x]);
        }

        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition","attachment;filename=holidayList" + System.currentTimeMillis() + ".xls");

        wd.write(response.getOutputStream());
        wd.close();
    }

}