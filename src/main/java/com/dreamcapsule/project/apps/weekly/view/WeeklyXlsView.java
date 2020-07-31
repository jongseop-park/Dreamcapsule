package com.dreamcapsule.project.apps.weekly.view;


import com.dreamcapsule.project.domain.DailyDomain;
import com.dreamcapsule.project.domain.WeeklyVO;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Component("WeeklyXls")
public class WeeklyXlsView extends AbstractXlsView {
    @Override
    protected void buildExcelDocument(Map<String, Object> map, Workbook workbook
            , HttpServletRequest httpServletRequest
            , HttpServletResponse httpServletResponse
            ) throws Exception {
        httpServletResponse.setHeader(
                "Content-Disposition","attachment; filename=\"weekly.xls\"");
        Sheet sheet = workbook.createSheet("daily_sheet");
        Row row=sheet.createRow(0);

        Cell cell;

        String[] headName={"직원","직무","직급","근무지","월","화","수","목","금","토","일","근무시간"};
        String[] week={"월","화","수","목","금","토","일"};

        for(int i=0; i<headName.length;i++){
            cell=row.createCell(i);
            cell.setCellValue(headName[i]);
            sheet.setColumnWidth(i,sheet.getColumnWidth(i)+1024);

        }

        for(int i = 0; i< ((List<WeeklyVO>)map.get("weeklyXls")).size(); i++){
            row = sheet.createRow(i+1);
            WeeklyVO weeklyVO = ((List<WeeklyVO>)map.get("weeklyXls")).get(i);
            String[] commti=weeklyVO.getCommTi().split(",");
            String[] workst=weeklyVO.getWorkSt().split(",");
            String[] weekst=weeklyVO.getWeekDate().split(",");
            String[] date = new String[7];

            for(int k=0;k<week.length;k++){
                try{
                    for(int n=0;n<weekst.length;n++){

                        if(week[k].equals(weekst[n])){

                            if(workst[n].equals("정상근무") || workst[n].equals("지각")){
                                date[k]=commti[n];
                                break;
                            }else{
                                date[k]=workst[n];
                                break;
                            }

                        }else{
                            date[k]="-";
                        }
                    }
                }catch (ArrayIndexOutOfBoundsException e){
                    date[k]="-";
                }

            }

            Object[] values = {weeklyVO.getEmplNm(), weeklyVO.getDutyId(),
                    weeklyVO.getRankId(),weeklyVO.getWorkPl()
                    ,date[0],date[1],date[2],date[3],date[4]
                    ,date[5],date[6],weeklyVO.getTotalTi()};



            for(int j=0; j<headName.length; j++){
                cell = row.createCell(j);
                cell.setCellValue(String.valueOf(values[j]));
            }
        }

    }

}
