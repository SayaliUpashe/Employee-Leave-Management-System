package com.employee.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;

public class AttendanceDAO {
	
	public static final String URL ="jdbc:mysql://localhost:3306/employeeleavemanagement";
	public static final String USER ="root";
	public static final String PASSWORD ="Saurabh@123";
	
	public static Connection getConnection() throws SQLException
	{
		return DriverManager.getConnection(URL,USER,PASSWORD);
	}
	
	public static boolean todayAttendance(int employeeId, Date attendanceDate, Time checkInTime, Time checkOutTime, String status)
	{
		boolean find = false;
		String query = "INSERT INTO attendance (employee_id, attendance_date, check_in_time, check_out_time, status) VALUES (?,?,?,?,?)";
		try(Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(query))
		{
			ps.setInt(1, employeeId);
			ps.setDate(2, attendanceDate);
			ps.setTime(3, checkInTime);
			ps.setTime(4, checkOutTime);
			ps.setString(5, status);
			
			int row = ps.executeUpdate();
			if(row > 0)
			{
				find = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return find;
	}
}
