package com.employee.model;

import java.sql.Date;

public class Employee {
	public int employeeId;
	public String firstName;
	public String lastName;
	public String email;
	public String phone_number;
	public Date dob;
	public String gender;
	public String job_title;
	public String department;
	public String employee_type;
	public Date dateofjoining;
	public String username;
	public String password;
	public String role;
	public String EmployeeStatus;
	public int totalLeave;
	private int leaveBalance;
	private int leaveTaken;
	
	
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phone_number;
	}
	public void setPhoneNumber(String phone_number) {
		this.phone_number = phone_number;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJobTitle() {
		return job_title;
	}
	public void setJobTitle(String job_title) {
		this.job_title = job_title;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getEmployeeType() {
		return employee_type;
	}
	public void setEmployeeType(String employee_type) {
		this.employee_type = employee_type;
	}
	public Date getDateOfJoining() {
		return dateofjoining;
	}
	public void setDateOfJoining(Date dateofjoining) {
		this.dateofjoining = dateofjoining;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getEmployeeStatus() {
		return EmployeeStatus;
	}
	public void setEmployeeStatus(String EmployeeStatus) {
		this.EmployeeStatus = EmployeeStatus;
	}
	
	public int getTotalLeave() {
		return totalLeave;
	}
	public void setTotalLeave(int totalLeave) {
		this.totalLeave = totalLeave;
	}
	public int getLeaveBalance() {
		return leaveBalance;
	}
	public void setLeaveBalance(int leaveBalance) {
		this.leaveBalance = leaveBalance;
	}
	public int getLeaveTaken() {
		return leaveTaken;
	}
	public void setLeaveTaken(int leaveTaken) {
		this.leaveTaken = leaveTaken;
	}
}
