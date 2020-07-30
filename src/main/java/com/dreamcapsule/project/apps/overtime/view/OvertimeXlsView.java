package com.dreamcapsule.project.apps.overtime.view;

import com.dreamcapsule.project.domain.OvertimeVO;
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

@Component("overtimeXls")
public class OvertimeXlsView extends AbstractXlsView {
    @Override
    protected void buildExcelDocument(Map<String, Object> map, Workbook workbook
            , HttpServletRequest httpServletRequest
            , HttpServletResponse httpServletResponse) throws Exception {
        final int COLUMN_NUM = 6;

        httpServletResponse.setHeader("Content-Disposition", "attachment; filename=\"overtime.xls\"");
        Sheet sheet = workbook.createSheet("overtime_sheet");
        Row row0 = sheet.createRow(0);
        Cell cell;

        String[] columnNames = {"직원", "직무", "직급", "야근날짜", "야근시간", "석식여부", "상태"};

        for(int i=0; i<=COLUMN_NUM; i++) {
            cell = row0.createCell(i);
            cell.setCellValue(columnNames[i]);
            sheet.setColumnWidth(i, sheet.getColumnWidth(i)+ 1024);
        }

        for(int i=1; i< ((List<OvertimeVO>)map.get("overtimeVOList")).size(); i++) {
            Row row = sheet.createRow(i);
            OvertimeVO overtimeVO = ((List<OvertimeVO>)map.get("overtimeVOList")).get(i-1);

            Object[] values= { overtimeVO.getEmpNm(), overtimeVO.getEmpJob(),
                    overtimeVO.getEmpPos(), overtimeVO.getOtDt(),
                    overtimeVO.getOtTm(), overtimeVO.getEatYn(),
                    overtimeVO.getStatus()
            };

            for(int j=0; j<=COLUMN_NUM; j++) {
                cell = row.createCell(j);
                cell.setCellValue(String.valueOf(values[j]));
            }
        }
    }
}
