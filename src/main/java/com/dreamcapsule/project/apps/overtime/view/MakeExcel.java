package com.dreamcapsule.project.apps.overtime.view;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Map;

public class MakeExcel {
    public void download(HttpServletRequest request, HttpServletResponse response,
                         Map<String, Object> bean, String fileName, String templateFile, String string)
                        throws ParsePropertyException, InvalidFormatException {
        String tempPath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload/template/");

        try {
            InputStream is = new BufferedInputStream(new FileInputStream(tempPath  + templateFile));

            XLSTransformer xls = new XLSTransformer();
            Workbook workbook = xls.transformXLS(is, bean);

            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + ".xls\"");
            OutputStream os = response.getOutputStream();
            workbook.write(os);

        } catch(IOException e) {
            e.printStackTrace();
        }
    }
}
