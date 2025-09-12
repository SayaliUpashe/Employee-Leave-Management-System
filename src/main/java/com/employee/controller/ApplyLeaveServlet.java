package com.employee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.LeaveDAO;
@WebServlet("/ApplyLeaveServlet")
public class ApplyLeaveServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		PrintWriter out = response.getWriter();
		int employeeid = Integer.parseInt(request.getParameter("employeeId"));
		String leaveType = request.getParameter("leaveType");
		Date startDate = Date.valueOf(request.getParameter("startDate"));
		Date endDate = Date.valueOf(request.getParameter("endDate"));
		
		boolean status = LeaveDAO.sendLeaveRequest(employeeid,leaveType,startDate,endDate);
		if(status)
		{
			out.print("<h3>Leave request is store</h3>");
			response.sendRedirect("ApplyForLeave.jsp");
		}
		else
		{
			out.print("<h3>Leave request is not store</h3>");
			response.sendRedirect("ApplyForLeave.jsp");
		}
		
	}

}
