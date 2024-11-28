package com.gd.mystore;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;

public class GeneratePdfServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // PDF 문서 생성
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        PdfWriter pdfWriter = new PdfWriter(byteArrayOutputStream);
        PdfDocument pdfDocument = new PdfDocument(pdfWriter);
        pdfDocument.setDefaultPageSize(PageSize.A4);
        Document document = new Document(pdfDocument);

        // ** Title **
        Paragraph title = new Paragraph("Payroll Statement - September")
                .setFontSize(18)
                .setTextAlignment(TextAlignment.CENTER)
                .setBold();
        document.add(title);

        // ** Payment Date Info **
        document.add(new Paragraph("\nPayment Date: November 28, 2024")
                .setFontSize(10)
                .setTextAlignment(TextAlignment.LEFT));

        // ** Employee Information Table **
        Table employeeInfoTable = new Table(UnitValue.createPercentArray(new float[]{1, 2, 1, 2}))
                .setWidth(UnitValue.createPercentValue(100))
                .setMarginBottom(20);

        employeeInfoTable.addCell(createCell("Department", true));
        employeeInfoTable.addCell(createCell("Content Development", false));
        employeeInfoTable.addCell(createCell("Position", true));
        employeeInfoTable.addCell(createCell("Researcher", false));
        employeeInfoTable.addCell(createCell("Name", true));
        employeeInfoTable.addCell(createCell("JoonSooKing", false));
        employeeInfoTable.addCell(createCell("Join Date", true));
        employeeInfoTable.addCell(createCell("2012-09-07", false));
        document.add(employeeInfoTable);

        // ** Salary Details Table **
        Table salaryTable = new Table(UnitValue.createPercentArray(new float[]{2, 2, 2, 2}))
                .setWidth(UnitValue.createPercentValue(100))
                .setMarginBottom(20);

        salaryTable.addCell(createCell("Payment Item", true));
        salaryTable.addCell(createCell("Amount", true));
        salaryTable.addCell(createCell("Deduction Item", true));
        salaryTable.addCell(createCell("Amount", true));

        salaryTable.addCell(createCell("Base Salary", false));
        salaryTable.addCell(createCell("2,500,000", false));
        salaryTable.addCell(createCell("Tax", false));
        salaryTable.addCell(createCell("84,290", false));

        salaryTable.addCell(createCell("Bonus", false));
        salaryTable.addCell(createCell("200,000", false));
        salaryTable.addCell(createCell("Resident Tax", false));
        salaryTable.addCell(createCell("9,420", false));

        salaryTable.addCell(createCell("Position Allowance", false));
        salaryTable.addCell(createCell("120,000", false));
        salaryTable.addCell(createCell("Pension", false));
        salaryTable.addCell(createCell("103,500", false));

        salaryTable.addCell(createCell("Extra Work Allowance", false));
        salaryTable.addCell(createCell("170,000", false));
        salaryTable.addCell(createCell("Health Insurance", false));
        salaryTable.addCell(createCell("66,700", false));

        salaryTable.addCell(createCell("Overtime Allowance", false));
        salaryTable.addCell(createCell("110,000", false));
        salaryTable.addCell(createCell("Employment Insurance", false));
        salaryTable.addCell(createCell("10,350", false));

        // 빈 행 추가
        for (int i = 0; i < 10; i++) { // 필요에 따라 10 이상의 값을 설정 가능
            salaryTable.addCell(createCell(" ", false));
            salaryTable.addCell(createCell(" ", false));
            salaryTable.addCell(createCell(" ", false));
            salaryTable.addCell(createCell(" ", false));
        }

        document.add(salaryTable);

        // ** Total Amounts **
        Table totalTable = new Table(UnitValue.createPercentArray(new float[]{1, 1}))
                .setWidth(UnitValue.createPercentValue(100))
                .setMarginTop(20);

        totalTable.addCell(createCell("Total Payment", true));
        totalTable.addCell(createCell("2,300,000", false));
        totalTable.addCell(createCell("Total Deduction", true));
        totalTable.addCell(createCell("333,260", false));
        totalTable.addCell(createCell("Net Payment", true));
        totalTable.addCell(createCell("1,966,380", false));
        document.add(totalTable);

        // Close document
        document.close();

        // HTTP response for PDF download
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=payroll.pdf");

        // Send generated PDF as response
        response.getOutputStream().write(byteArrayOutputStream.toByteArray());
    }

    private Cell createCell(String content, boolean isHeader) {
        Cell cell = new Cell().add(new Paragraph(content));
        if (isHeader) {
            cell.setBold();
        }
        cell.setTextAlignment(TextAlignment.CENTER);
        cell.setHeight(20); // 행 높이 추가 설정
        return cell;
    }
}
