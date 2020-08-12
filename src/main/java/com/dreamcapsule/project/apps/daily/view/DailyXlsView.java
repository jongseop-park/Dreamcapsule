package com.dreamcapsule.project.apps.daily.view;

import com.dreamcapsule.project.domain.DailyDomain;
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

@Component("dailyXls")
public class DailyXlsView extends AbstractXlsView {
    @Override
    protected void buildExcelDocument(Map<String, Object> map, Workbook workbook
            , HttpServletRequest httpServletRequest
            , HttpServletResponse httpServletResponse
            ) throws Exception {
        String regDt=(String)map.get("dailyDay");
        httpServletResponse.setHeader(
            "Content-Disposition","attachment; filename=\"daily"+"_"+regDt+".xls\"");
        Sheet sheet = workbook.createSheet("daily_sheet");
        Row row=sheet.createRow(0);
        
        Cell cell;

        String[] headName={"직원","직무","직급","출근시간","퇴근시간","상태","근무시간","휴게시간","근무지","날짜"};

        for(int i=0; i<headName.length;i++){
            cell=row.createCell(i);
            cell.setCellValue(headName[i]);
            sheet.setColumnWidth(i,sheet.getColumnWidth(i)+1024);

        }

        for(int i=0; i< ((List<DailyDomain>)map.get("dailyXlsList")).size();i++){
            row = sheet.createRow(i+1);
            DailyDomain dailyDomain = ((List<DailyDomain>)map.get("dailyXlsList")).get(i);

            Object[] values = {dailyDomain.getEmplNm(), dailyDomain.getDutyNm(),
                    dailyDomain.getRankNm(), dailyDomain.getOnwTi(),dailyDomain.getOffwTi(),dailyDomain.getWorkSt(),
                    dailyDomain.getWorkTi(), dailyDomain.getRestTi(),dailyDomain.getWorkPl(),dailyDomain.getRegDt()
            };
            for(int j=0; j<headName.length; j++){
                cell = row.createCell(j);
                cell.setCellValue(String.valueOf(values[j]));
            }
        }

    }
}
