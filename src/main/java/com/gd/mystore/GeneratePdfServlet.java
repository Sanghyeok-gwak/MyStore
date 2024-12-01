package com.gd.mystore;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
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

     // 폰트 파일 경로 설정 (EmbeddingStrategy 제거)
        File regularFontFile = new File("/MYSTORE/MyStore/src/main/resources/fonts/NanumGothic-Regular.ttf");
        PdfFont pdfFont = PdfFontFactory.createFont(regularFontFile.getAbsolutePath()); // EmbeddingStrategy를 제거

        // ** Title ** (한글 타이틀)
        Paragraph title = new Paragraph("pay stub - 12Month")
                .setFont(pdfFont)  // 한글 폰트를 설정
                .setFontSize(18)
                .setTextAlignment(TextAlignment.CENTER)
                .setBold();
        document.add(title);

        // ** Payment Date Info ** (한글로 변경)
        document.add(new Paragraph("\n payment day: 2024Y 12M 03D")
                .setFont(pdfFont)  // 한글 폰트를 설정
                .setFontSize(10)
                .setTextAlignment(TextAlignment.LEFT));

        // ** Employee Information Table ** (한글로 변경)
        Table employeeInfoTable = new Table(UnitValue.createPercentArray(new float[]{1, 2, 1, 2}))
                .setWidth(UnitValue.createPercentValue(100))
                .setMarginBottom(20);

        employeeInfoTable.addCell(createCell("Department", true, pdfFont)); // Department
        employeeInfoTable.addCell(createCell("Content Development", false, pdfFont)); // Content Development
        employeeInfoTable.addCell(createCell("Position", true, pdfFont)); // Position
        employeeInfoTable.addCell(createCell("Researcher", false, pdfFont)); // Researcher
        employeeInfoTable.addCell(createCell("Name", true, pdfFont)); // Name
        employeeInfoTable.addCell(createCell("Leesiyeon", false, pdfFont)); // Name
        employeeInfoTable.addCell(createCell("Join Date", true, pdfFont)); // Join Date
        employeeInfoTable.addCell(createCell("2024-11-05", false, pdfFont)); // Join Date
        document.add(employeeInfoTable);

        // ** Salary Details Table ** (한글로 변경)
        Table salaryTable = new Table(UnitValue.createPercentArray(new float[]{2, 2, 2, 2}))
                .setWidth(UnitValue.createPercentValue(100))
                .setMarginBottom(20);

        salaryTable.addCell(createCell("Payment Item", true, pdfFont)); // Payment Item
        salaryTable.addCell(createCell("Amount", true, pdfFont)); // Amount
        salaryTable.addCell(createCell(" Deduction Item", true, pdfFont)); // Deduction Item
        salaryTable.addCell(createCell("Amount", true, pdfFont)); // Amount

        salaryTable.addCell(createCell(" Base Salary", false, pdfFont)); // Base Salary
        salaryTable.addCell(createCell("2,500,000", false, pdfFont));
        salaryTable.addCell(createCell("Tax", false, pdfFont)); // Tax
        salaryTable.addCell(createCell("84,290", false, pdfFont));

        salaryTable.addCell(createCell("Bonus", false, pdfFont)); // Bonus
        salaryTable.addCell(createCell("200,000", false, pdfFont));
        salaryTable.addCell(createCell("Resident Tax", false, pdfFont)); // Resident Tax
        salaryTable.addCell(createCell("9,420", false, pdfFont));

        salaryTable.addCell(createCell("Position Allowance", false, pdfFont)); // Position Allowance
        salaryTable.addCell(createCell("120,000", false, pdfFont));
        salaryTable.addCell(createCell("Pension", false, pdfFont)); // Pension
        salaryTable.addCell(createCell("103,500", false, pdfFont));

        salaryTable.addCell(createCell("Extra Work Allowance", false, pdfFont)); // Extra Work Allowance
        salaryTable.addCell(createCell("170,000", false, pdfFont));
        salaryTable.addCell(createCell(" Health Insurance", false, pdfFont)); // Health Insurance
        salaryTable.addCell(createCell("66,700", false, pdfFont));

        salaryTable.addCell(createCell("Overtime Allowance", false, pdfFont)); // Overtime Allowance
        salaryTable.addCell(createCell("110,000", false, pdfFont));
        salaryTable.addCell(createCell("Employment Insurance", false, pdfFont)); // Employment Insurance
        salaryTable.addCell(createCell("10,350", false, pdfFont));

        // 빈 행 추가
        for (int i = 0; i < 10; i++) { // 필요에 따라 10 이상의 값을 설정 가능
            salaryTable.addCell(createCell(" ", false, pdfFont));
            salaryTable.addCell(createCell(" ", false, pdfFont));
            salaryTable.addCell(createCell(" ", false, pdfFont));
            salaryTable.addCell(createCell(" ", false, pdfFont));
        }

        document.add(salaryTable);

        // ** Total Amounts ** (한글로 변경)
        Table totalTable = new Table(UnitValue.createPercentArray(new float[]{1, 1}))
                .setWidth(UnitValue.createPercentValue(100))
                .setMarginTop(20);

        totalTable.addCell(createCell("Total Payment", true, pdfFont)); // Total Payment
        totalTable.addCell(createCell("2,500,000", false, pdfFont));
        totalTable.addCell(createCell(" Total Deduction", true, pdfFont)); // Total Deduction
        totalTable.addCell(createCell("433,260", false, pdfFont));
        totalTable.addCell(createCell("Net Payment", true, pdfFont)); // Net Payment
        totalTable.addCell(createCell("2,166,380", false, pdfFont));
        document.add(totalTable);

        // Close document
        document.close();

        // HTTP response for PDF download
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=payroll.pdf");

        // Send generated PDF as response
        response.getOutputStream().write(byteArrayOutputStream.toByteArray());
    }

    private Cell createCell(String content, boolean isHeader, PdfFont font) {
        Cell cell = new Cell().add(new Paragraph(content).setFont(font));
        if (isHeader) {
            cell.setBold();
        }
        cell.setTextAlignment(TextAlignment.CENTER);
        cell.setHeight(20); // 행 높이 추가 설정
        return cell;
    }
}
