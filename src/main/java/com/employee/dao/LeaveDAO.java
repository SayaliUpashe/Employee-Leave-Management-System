package com.employee.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.employee.model.Leave;

public class LeaveDAO {
	public static final String URL ="jdbc:mysql://localhost:3306/employeeleavemanagement";
	public static final String USER ="root";
	public static final String PASSWORD ="Saurabh@123";
	
	public static Connection getConnection() throws SQLException
	{
		return DriverManager.getConnection(URL,USER,PASSWORD);
	}
	
	public static boolean sendLeaveRequest(int employeeid, String leavetype,Date startdate,Date enddate)throws IOException
	{
		boolean status = false;
		int leavedays = calculateDays(startdate, enddate);
		String query = "INSERT INTO leaverequests (employee_id, leave_type, start_date, end_date,leave_days,leave_status,applied_on) VALUES (?, ?, ?, ?, ?, 'Pending' , CURRENT_DATE)";
		try(Connection conn = getConnection();PreparedStatement ps = conn.prepareStatement(query)) 
		{
			ps.setInt(1, employeeid);
			ps.setString(2, leavetype);
			ps.setDate(3, startdate);
			ps.setDate(4, enddate);
			ps.setInt(5, leavedays);
			
			int row = ps.executeUpdate();
			if(row > 0)
			{
				status = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public static int calculateDays(Date startdate,Date enddate)
	{
		long diffInMillies = enddate.getTime() - startdate.getTime();
	    long diffInDays = (diffInMillies / (1000 * 60 * 60 * 24)) + 1; // +1 to include both start & end dates
	    return (int) diffInDays;
	}
	
	
	public static List<Leave> getPendingRequests() {
	    List<Leave> list = new ArrayList<>();
	    String sql = "SELECT * FROM leaverequests WHERE leave_status = 'Pending'";
	    
	    try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
	        
	        while (rs.next()) {
	            Leave lr = new Leave();
	            lr.setLeaveId(rs.getInt("leave_id"));
	            lr.setEmployeeId(rs.getInt("employee_id"));
	            lr.setLeaveType(rs.getString("leave_type"));
	            lr.setStartDate(rs.getDate("start_date"));
	            lr.setEndDate(rs.getDate("end_date"));
	            lr.setLeaveDays(rs.getInt("leave_days"));
	            lr.setAppliedOn(rs.getTimestamp("applied_on"));
	            lr.setLeaveStatus(rs.getString("leave_status"));
	            list.add(lr);
	            System.out.println("Total pending leaves fetched: " + list.size());


	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	
	
	/*
	 * public static void updateLeaveStatus(int leaveId, String status, int
	 * employeeid) { String query =
	 * "UPDATE leaverequests SET leave_status = ? , approved_by = ?,approval_date = NOW() WHERE leave_id = ?"
	 * ; try(Connection conn = getConnection();PreparedStatement ps =
	 * conn.prepareStatement(query)) { ps.setString(1, status); ps.setInt(2,
	 * employeeid); ps.setInt(3, leaveId); ps.executeUpdate();
	 * 
	 * } catch(Exception e) { e.printStackTrace(); } }
	 */
	
	public static void updateLeaveStatus(int leaveId, String status, int employeeid) {
	    String updateStatusQuery = "UPDATE leaverequests SET leave_status = ?, approved_by = ?, approval_date = NOW() WHERE leave_id = ?";
	    String selectLeaveQuery = "SELECT employee_id, leave_days FROM leaverequests WHERE leave_id = ?";
	    String updateEmployeeLeave = "UPDATE employee SET leave_taken = leave_taken + ? WHERE employee_id = ?";

	    Connection conn = null;

	    try {
	        conn = getConnection();
	        if (conn == null) {
	            System.out.println("Database connection failed.");
	            return;
	        }

	        conn.setAutoCommit(false);

	        int employeeId = 0;
	        int leaveDays = 0;

	        // Step 1: Fetch leave request details
	        try (PreparedStatement ps1 = conn.prepareStatement(selectLeaveQuery)) {
	            ps1.setInt(1, leaveId);
	            ResultSet rs = ps1.executeQuery();

	            if (rs.next()) {
	                employeeId = rs.getInt("employee_id");
	                leaveDays = rs.getInt("leave_days");
	            } else {
	                System.out.println("Leave request not found.");
	                conn.rollback();
	                return;
	            }
	        }

	        // ✅ Step 2: Update leave request status
	        try (PreparedStatement ps2 = conn.prepareStatement(updateStatusQuery)) {
	            ps2.setString(1, status);
	            ps2.setInt(2, employeeid);
	            ps2.setInt(3, leaveId);

	            int rowsUpdated = ps2.executeUpdate();
	            System.out.println("Leave request status updated: " + rowsUpdated + " row(s) affected.");
	        }

	        // ✅ Step 3: If approved, update leave_taken
	        if ("Approved".equalsIgnoreCase(status)) {
	            try (PreparedStatement ps3 = conn.prepareStatement(updateEmployeeLeave)) {
	                ps3.setInt(1, leaveDays);
	                ps3.setInt(2, employeeId);

	                int empUpdated = ps3.executeUpdate();
	                System.out.println("Employee leave updated: " + empUpdated + " row(s) affected.");
	            }
	        }

	        conn.commit();
	        System.out.println("Transaction committed successfully.");

	    } catch (Exception e) {
	        e.printStackTrace();
	        try {
	            if (conn != null) conn.rollback();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    } finally {
	        try {
	            if (conn != null && !conn.isClosed()) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}


}
