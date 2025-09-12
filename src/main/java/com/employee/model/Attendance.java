package com.employee.model;

import java.sql.Date;
import java.sql.Time;

public class Attendance {
	private int employeeId;
    private Date attendanceDate;
    private Time checkInTime;
    private Time checkOutTime;
    private String status;
    
    
    public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public Date getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(Date attendanceDate) {
		this.attendanceDate = attendanceDate;
	}
	public Time getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(Time checkInTime) {
		this.checkInTime = checkInTime;
	}
	public Time getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(Time checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
