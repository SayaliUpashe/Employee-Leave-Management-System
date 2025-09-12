package com.employee.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.EmployeeDAO;
import com.employee.dao.PayrollDAO;
import com.employee.model.Employee;
import com.employee.model.Payroll;

@WebServlet("/PayrollServlet")
public class PayrollServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String action = request.getParameter("action");
		
		if("managePayroll".equals(action))
		{
			List<Employee> list = EmployeeDAO.getAllEmployeeId();
			request.setAttribute("employeeList", list);
			request.getRequestDispatcher("Payroll.jsp").forward(request, response);
		}
		else if("payment".equals(action))
		{
			Payroll list = PayrollDAO.getPaymentDetails();
			request.setAttribute("payroll", list);
			request.getRequestDispatcher("paymentDetails.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect("HR_DashBoard.jsp");
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		System.out.println("Into doPost Method");
		int employeeid = Integer.parseInt(request.getParameter("employeeId"));
		double salary = Double.parseDouble(request.getParameter("salary"));
		double taxDeductions = Double.parseDouble(request.getParameter("taxDeductions"));
		long BankAccount = Long.parseLong(request.getParameter("bankAccount"));
		/* double netSalary = Double.parseDouble(request.getParameter("netSalary")); */
		Date paymentDate = Date.valueOf(request.getParameter("paymentDate"));
		
		boolean status = PayrollDAO.salarySend(employeeid,salary,taxDeductions,BankAccount,paymentDate);
		if(status)
		{
			System.out.println("Salary is done");
			response.sendRedirect("Payroll.jsp");
		}
		else
		{
			System.out.println("Salary is not done");
		}
	}

}
