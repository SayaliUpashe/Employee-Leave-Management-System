package com.employee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.dao.EmployeeDAO;
import com.employee.model.Employee;

@WebServlet("/checkBalanceServlet")
public class checkBalanceServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("employee");//Assume "employee" stored in session after login
		System.out.println("Employee id"+employee);
		if(employee != null)
		{
		
			Employee employeeDetails = EmployeeDAO.getLeaveDetails(employee.getEmployeeId());
			if(employeeDetails != null)
			{
				request.setAttribute("employee", employeeDetails);
				
				request.getRequestDispatcher("checkBalance.jsp").forward(request, response);
			}
			
		}
		else
		{
			response.sendRedirect("Login.jsp");
		}
		
	}

}
