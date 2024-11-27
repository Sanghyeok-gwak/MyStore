package com.gd.mystore;

import java.io.FileNotFoundException;

import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

public class GeneratePdf {
	public static void main(String[] args) throws FileNotFoundException {
		String path="util.pdf";
		PdfWriter pdfWriter=new PdfWriter(path);
		PdfDocument pdfDocument=new PdfDocument(pdfWriter);
		pdfDocument.setDefaultPageSize(PageSize.A4);
		Document document=new Document(pdfDocument);
		
		document.add(new Paragraph("hello world"));
		document.close();
	}

}
