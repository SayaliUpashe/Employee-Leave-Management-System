package com.employee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.PayrollDAO;
import com.employee.model.Payroll;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;


@WebServlet("/DownloadPaymentPDFServlet")
public class DownloadPaymentPDFServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the employeeId from the request
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));

        // Fetch payroll details for the given employeeId
        Payroll payroll = PayrollDAO.getPayrollByEmployeeId(employeeId);

        if (payroll != null) {
            // Set response content type as PDF
            response.setContentType("application/pdf");

            // Set the content disposition for download
            response.setHeader("Content-Disposition", "attachment;filename=Payroll_Receipt_" + employeeId + ".pdf");

            // Create a new PDF document
            Document document = new Document();

            try {
                // Get the OutputStream of the response
                ServletOutputStream out = response.getOutputStream();

                // Create a PdfWriter instance to write to the response output stream
                PdfWriter.getInstance(document, out);

                // Open the document to write
                document.open();

                // Add payroll information to the PDF
                document.add(new Paragraph("Payroll Receipt"));
                document.add(new Paragraph("Employee ID: " + payroll.getEmployeeId()));
                document.add(new Paragraph("Salary: " + payroll.getSalary()));
                document.add(new Paragraph("Tax Deductions: " + payroll.getTaxDeductions()));
                document.add(new Paragraph("Net Salary: " + payroll.getNetSalary()));
                document.add(new Paragraph("Bank Account: " + payroll.getBankAccount()));
                document.add(new Paragraph("Payment Date: " + payroll.getPaymentDate()));

                // Close the document
                document.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // Handle the case where no payroll data was found for the employeeId
            response.getWriter().write("Payroll data not found for Employee ID: " + employeeId);
        }
    }
}