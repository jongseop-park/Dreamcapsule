package com.dreamcapsule.project.apps.report.view;

import com.dreamcapsule.project.domain.ReportVO;
import org.apache.ibatis.javassist.tools.rmi.Sample;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Component("reportXls")
public class ReportXlsView extends AbstractXlsView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, Workbook workbook, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        final int COLUMN_NUM = 10;

        httpServletResponse.setHeader("Content-Disposition", "attachment; filename=\"report.xls\"");
        Sheet sheet = workbook.createSheet("report_sheet");
        Row row0 = sheet.createRow(0);

        String[] columnNames = {"직원", "입사일", "실제근로일수", "실제근로시간",
                "유급휴가시간", "실제초과근로시간", "계획야간근로시간", "실제야간근로시간",
                "휴가횟수", "지각횟수", "결근횟수"};
        Cell cell;

        for(int i=0; i<=COLUMN_NUM; i++) {
            cell = row0.createCell(i);
            cell.setCellValue(columnNames[i]);
            sheet.setColumnWidth(i, sheet.getColumnWidth(i) + 1024);
        }

        for(int i=1; i <= ((List<ReportVO>)map.get("reportVOList")).size(); i++) {
            Row row = sheet.createRow(i);
            ReportVO reportVO = ((List<ReportVO>)map.get("reportVOList")).get(i-1);

            Object[] values = { reportVO.getEmpName(), reportVO.getHireDate(), reportVO.getWorkDate(),
                    reportVO.getWorkTime(), reportVO.getPayVacationTime(), reportVO.getOvertimeWorkTime(),
                    reportVO.getPlanOvertime(), reportVO.getActualOvertime(),
                    reportVO.getVacationCount() +  "/" + ((List<ReportVO>)map.get("reportVOList")).get(i-1).getVacationTotal() ,
                    reportVO.getLateCount(), reportVO.getAbsentCount()};

            for(int j=0; j<= COLUMN_NUM; j++) {
                cell = row.createCell(j);
                cell.setCellValue(String.valueOf(values[j]));
            }
        }
    }
}
