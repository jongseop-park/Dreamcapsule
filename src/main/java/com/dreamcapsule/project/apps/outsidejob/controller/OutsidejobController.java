package com.dreamcapsule.project.apps.outsidejob.controller;

import com.dreamcapsule.project.apps.outsidejob.domain.OutsideJobPageMaker;
import com.dreamcapsule.project.apps.outsidejob.domain.OutsideJobSearchCriteria;
import com.dreamcapsule.project.apps.outsidejob.service.OutsidejobService;
import com.dreamcapsule.project.domain.*;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class OutsidejobController {

    @Autowired
    OutsidejobService outsidejobService;

    @RequestMapping("outside_details")
    public String outsideDetail(Model model,@Param("seq") int seq){
        OutsidejobVO outsideJobList = outsidejobService.findListSeq(seq);
        OutsidejobVO outsideJobInfo = outsidejobService.findInfoSeq(outsideJobList.getUserNum());

        model.addAttribute("outsideJobList",outsideJobList);
        model.addAttribute("outsideJobInfo",outsideJobInfo);

        return "outsidejob/outsidejob_details";
    }

    @RequestMapping("/outside_update")
    public String detailsUpdate(HttpServletRequest request){
        char state;
        String stateValue = request.getParameter("state");
        if(stateValue.equals("승인")){
            state = 'Y';
        }else{
            state = 'N';
        }
        int seq = Integer.parseInt(request.getParameter("seq"));
        String reply = request.getParameter("reply");

        outsidejobService.detailsUpdate(state,reply,seq);

        return "redirect:outside";
    }

    @RequestMapping(value= "/outside" , method = RequestMethod.GET)
    public String listSearch(@ModelAttribute("scri") OutsideJobSearchCriteria scri, Model model) throws Exception {
        List<OutsidejobVO> searchList = outsidejobService.findAllPage(scri);
        model.addAttribute("searchList", searchList);
        model.addAttribute("scri", scri);

        OutsideJobPageMaker pageMaker = new OutsideJobPageMaker();
        pageMaker.setCri(scri);
        pageMaker.setTotalCount(outsidejobService.countSearch(scri));
        model.addAttribute("pageMaker", pageMaker);

        return "outsidejob/outsidejob_total";
    }

    @RequestMapping("/outsideExcelDown.do")
    public void holidayExcelDown(HttpServletResponse response) throws Exception {
        List<OutsidejobVO> outsideJobList = outsidejobService.findAll();
        List<OutsidejobVO> outsideJobInfo = outsidejobService.findInfo();

        Workbook wd = new HSSFWorkbook();
        Sheet sheet = wd.createSheet("외근 관리");
        Row row = null;
        Cell cell = null;
        int rowNo = 0;
        final int columnNum = 8;

        String[] columnNames = {"직원", "직무", "직급", "외근일", "출/퇴근 시간", "출근지", "퇴근지", "상태"};

        row = sheet.createRow(rowNo++);
        for (int x = 0; x < columnNum; x++) {
            cell = row.createCell(x);
            cell.setCellValue(columnNames[x]);
        }
        int seq;
        int y;
        for (int x = 0; x < outsideJobList.size();x++){
            row = sheet.createRow(rowNo++);
            seq = outsideJobList.get(x).getUserNum().intValue()-1;
            String[] value = {outsideJobInfo.get(seq).getName(),outsideJobInfo.get(seq).getTask(),outsideJobInfo.get(seq).getJobGrade(),outsideJobList.get(x).getMonth() + " (총 " + outsideJobList.get(x).getDay() + "일)",outsideJobList.get(x).getStartTime() + " ~ " + outsideJobList.get(x).getEndTime(),outsideJobList.get(x).getStartPlace(),outsideJobList.get(x).getEndPlace()};
            for(y = 0; y < value.length;y++){
                cell = row.createCell(y);
                cell.setCellValue(value[y]);
            }
            cell = row.createCell(y);
            switch(outsideJobList.get(x).getStateYsn()){
                case 'Y' :
                    cell.setCellValue("승인");
                    break;
                case 'S' :
                    cell.setCellValue("대기중");
                    break;
                case 'N' :
                    cell.setCellValue("반려");
                    break;
            }
        }

        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=outsideJobList" + System.currentTimeMillis() + ".xls");

        wd.write(response.getOutputStream());
        wd.close();
    }
}
