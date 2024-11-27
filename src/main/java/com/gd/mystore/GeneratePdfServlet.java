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
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.LineSeparator;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.UnitValue;

public class GeneratePdfServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ByteArrayOutputStream을 사용하여 PDF를 메모리에서 생성
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();

		// iText 7을 사용하여 PDF 문서 생성
		PdfWriter pdfWriter = new PdfWriter(byteArrayOutputStream);
		PdfDocument pdfDocument = new PdfDocument(pdfWriter);
		pdfDocument.setDefaultPageSize(PageSize.A4);
		Document document = new Document(pdfDocument);

		float twocol = 285f;
		float twocol150 = twocol + 150f;
		float twocolumnWidth[] = { twocol150, twocol };

		// PDF 내용 추가
		Table table = new Table(twocolumnWidth);
		document.add(new Cell().add("$ NO.").setBold().setBorder(Border.NO_BORDER));
		document.add(new Cell().add("Name : chun ye chan").setBold().setBorder(Border.NO_BORDER));
		document.add(new Cell().add("age : 25").setBold().setBorder(Border.NO_BORDER));
		document.add(new Cell().add("gender : F").setBold().setBorder(Border.NO_BORDER));

		/*
		 * // 선 스타일 정의 LineSeparator lineSeparator = new LineSeparator(new
		 * SolidBorder(1)); lineSeparator.setWidth(UnitValue.createPercentValue(100));
		 * // 선 너비 설정 lineSeparator.setMarginTop(10); // 위쪽 여백
		 * lineSeparator.setMarginBottom(10); // 아래쪽 여백
		 * 
		 * // 문서에 추가 document.add(lineSeparator);
		 */
		document.add(new Paragraph("don"));
		document.add(new Paragraph("name: chun ye chan"));
		document.add(new Paragraph("salary: 1원"));
		document.add(new Paragraph("bonus: 1원"));
		document.add(new Paragraph("Total: 2원"));

		document.close();

		// HTTP 응답 설정: PDF 파일 다운로드 처리
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=payroll.pdf");

		// 생성된 PDF 데이터를 HTTP 응답으로 전송
		response.getOutputStream().write(byteArrayOutputStream.toByteArray());
	}
}
