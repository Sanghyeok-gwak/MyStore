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
        File regularFontFile = new File("src/main/resources/fonts/NanumGothic-Regular.ttf");
        PdfFont pdfFont = PdfFontFactory.createFont(regularFontFile.getAbsolutePath()); // EmbeddingStrategy를 제거

        // ** Title ** (한글 타이틀)
        Paragraph title = new Paragraph("급여 명세서 - 9월")
                .setFont(pdfFont)  // 한글 폰트를 설정
                .setFontSize(18)
                .setTextAlignment(TextAlignment.CENTER)
                .setBold();
        document.add(title);

        // ** Payment Date Info ** (한글로 변경)
        document.add(new Paragraph("\n지급일: 2024년 11월 28일")
                .setFont(pdfFont)  // 한글 폰트를 설정
                .setFontSize(10)
                .setTextAlignment(TextAlignment.LEFT));

        // ** Employee Information Table ** (한글로 변경)
        Table employeeInfoTable = new Table(UnitValue.createPercentArray(new float[]{1, 2, 1, 2}))
                .setWidth(UnitValue.createPercentValue(100))
                .setMarginBottom(20);

        employeeInfoTable.addCell(createCell("부서", true, pdfFont)); // Department
        employeeInfoTable.addCell(createCell("콘텐츠 개발", false, pdfFont)); // Content Development
        employeeInfoTable.addCell(createCell("직위", true, pdfFont)); // Position
        employeeInfoTable.addCell(createCell("연구원", false, pdfFont)); // Researcher
        employeeInfoTable.addCell(createCell("이름", true, pdfFont)); // Name
        employeeInfoTable.addCell(createCell("JoonSooKing", false, pdfFont)); // Name
        employeeInfoTable.addCell(createCell("입사일", true, pdfFont)); // Join Date
        employeeInfoTable.addCell(createCell("2012-09-07", false, pdfFont)); // Join Date
        document.add(employeeInfoTable);

        // ** Salary Details Table ** (한글로 변경)
        Table salaryTable = new Table(UnitValue.createPercentArray(new float[]{2, 2, 2, 2}))
                .setWidth(UnitValue.createPercentValue(100))
                .setMarginBottom(20);

        salaryTable.addCell(createCell("지급 항목", true, pdfFont)); // Payment Item
        salaryTable.addCell(createCell("금액", true, pdfFont)); // Amount
        salaryTable.addCell(createCell("공제 항목", true, pdfFont)); // Deduction Item
        salaryTable.addCell(createCell("금액", true, pdfFont)); // Amount

        salaryTable.addCell(createCell("기본 급여", false, pdfFont)); // Base Salary
        salaryTable.addCell(createCell("2,500,000", false, pdfFont));
        salaryTable.addCell(createCell("세금", false, pdfFont)); // Tax
        salaryTable.addCell(createCell("84,290", false, pdfFont));

        salaryTable.addCell(createCell("보너스", false, pdfFont)); // Bonus
        salaryTable.addCell(createCell("200,000", false, pdfFont));
        salaryTable.addCell(createCell("주민세", false, pdfFont)); // Resident Tax
        salaryTable.addCell(createCell("9,420", false, pdfFont));

        salaryTable.addCell(createCell("직위 수당", false, pdfFont)); // Position Allowance
        salaryTable.addCell(createCell("120,000", false, pdfFont));
        salaryTable.addCell(createCell("연금", false, pdfFont)); // Pension
        salaryTable.addCell(createCell("103,500", false, pdfFont));

        salaryTable.addCell(createCell("초과 근무 수당", false, pdfFont)); // Extra Work Allowance
        salaryTable.addCell(createCell("170,000", false, pdfFont));
        salaryTable.addCell(createCell("건강 보험", false, pdfFont)); // Health Insurance
        salaryTable.addCell(createCell("66,700", false, pdfFont));

        salaryTable.addCell(createCell("시간 외 수당", false, pdfFont)); // Overtime Allowance
        salaryTable.addCell(createCell("110,000", false, pdfFont));
        salaryTable.addCell(createCell("고용 보험", false, pdfFont)); // Employment Insurance
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

        totalTable.addCell(createCell("총 지급액", true, pdfFont)); // Total Payment
        totalTable.addCell(createCell("2,300,000", false, pdfFont));
        totalTable.addCell(createCell("총 공제액", true, pdfFont)); // Total Deduction
        totalTable.addCell(createCell("333,260", false, pdfFont));
        totalTable.addCell(createCell("실 지급액", true, pdfFont)); // Net Payment
        totalTable.addCell(createCell("1,966,380", false, pdfFont));
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
