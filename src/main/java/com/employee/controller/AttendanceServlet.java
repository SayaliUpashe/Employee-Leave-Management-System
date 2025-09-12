package com.employee.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.AttendanceDAO;

@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		int employeeId = Integer.parseInt(request.getParameter("employeeId"));
		Date attendanceDate = Date.valueOf(request.getParameter("attendanceDate"));
		
		// when we input time that time he get only HH:MM and we convert String to Time (Using Time.valueOf()) that time Time.valueOf() required HH:MM:SS 
		// so that why i write like this
		String timeIn = request.getParameter("checkInTime");// e.g., "09:30"
		timeIn += ":00"; // convert to "09:30:00"
		Time checkInTime = Time.valueOf(timeIn);
		
		
		String timeOut = request.getParameter("checkOutTime");// e.g, "01:15"
		timeOut += ":00";//convert to "01:15:00"
		Time checkOutTime = Time.valueOf(timeOut);
		
		String status = request.getParameter("status");
		
		boolean find = AttendanceDAO.todayAttendance(employeeId,attendanceDate,checkInTime,checkOutTime,status);
		if(find)
		{
			System.out.println("Attendance is done");
			response.sendRedirect("EmployeeAttendance.jsp");
		}
		else
		{
			System.out.println("Attendance is not done");
		}
	}
}
