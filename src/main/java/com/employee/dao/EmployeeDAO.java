package com.employee.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.employee.model.Employee;

public class EmployeeDAO {
	
	public static final String URL ="jdbc:mysql://localhost:3306/employeeleavemanagement";
	public static final String USER ="root";
	public static final String PASSWORD ="Saurabh@123";
	
	public static Connection getConnection() throws SQLException
	{
		return DriverManager.getConnection(URL,USER,PASSWORD);
	}
	
	public static boolean addEmployee(Employee emp)
	{
		boolean status = false;
		String query = "INSERT INTO employee (first_name,last_name,email,phone_number,dob,gender,job_title,department,employee_type,date_of_joining,username,password_hash,role) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try(Connection conn = getConnection();PreparedStatement ps = conn.prepareStatement(query))
		{
			ps.setString(1, emp.getFirstName());
            ps.setString(2, emp.getLastName());
            ps.setString(3, emp.getEmail());
            ps.setString(4, emp.getPhoneNumber());
            ps.setDate(5, emp.getDob());
            ps.setString(6, emp.getGender());
            ps.setString(7, emp.getJobTitle());
            ps.setString(8, emp.getDepartment());
            ps.setString(9, emp.getEmployeeType());
            ps.setDate(10, emp.getDateOfJoining());
            ps.setString(11, emp.getUsername());
            ps.setString(12, emp.getPassword());
            ps.setString(13, emp.getRole());
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
	
	public static Employee ValidateLoggin(String username, String password)
	{
		Employee emp = null;
		String query = "SELECT * FROM employee WHERE username = ?";
		try(Connection conn = getConnection();PreparedStatement ps = conn.prepareStatement(query))
		{
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				String dbHashPassword = rs.getString("password_hash");
				if(BCrypt.checkpw(password,dbHashPassword))//Here we use BCrypt because we can retrive password from the database in the database password is
				{										 //store in hash format so thats why we use BCrypt.checkpw()
					emp = new Employee();
					emp.setEmployeeId(Integer.parseInt(rs.getString("employee_id")));
					emp.setFirstName(rs.getString("first_name"));
					emp.setLastName(rs.getString("last_name"));
	                emp.setEmail(rs.getString("email"));
	                emp.setPhoneNumber(rs.getString("phone_number"));
	                emp.setDob(rs.getDate("dob"));
	                emp.setGender(rs.getString("gender"));
	                emp.setDepartment(rs.getString("department"));
	                emp.setJobTitle(rs.getString("job_title"));
	                emp.setDateOfJoining(rs.getDate("date_of_joining"));
	                emp.setUsername(rs.getString("username"));
	                emp.setRole(rs.getString("role"));
					
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return emp;
	}
	
	public static List<Employee> getAllEmployeeId()
	{
		List<Employee> list = new ArrayList<>();
		String query = "SELECT employee_id,first_name,last_name FROM employee";
		try(Connection conn = getConnection();PreparedStatement ps = conn.prepareStatement(query))
		{
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Employee emp = new Employee();
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				list.add(emp);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
				
	}
	
	public static Employee getLeaveDetails(int employeeid)
	{
		Employee emp = null;
		String query = "SELECT employee_id, first_name, last_name,total_leave, leave_taken, leave_balance FROM employee WHERE employee_id = ?";
		try(Connection conn = getConnection();PreparedStatement ps = conn.prepareStatement(query))
		{
			ps.setInt(1, employeeid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				    emp = new Employee();
	                emp.setEmployeeId(rs.getInt("employee_id"));
	                emp.setFirstName(rs.getString("first_name"));
	                emp.setLastName(rs.getString("last_name"));
	                emp.setTotalLeave(rs.getInt("total_leave"));
	                emp.setLeaveBalance(rs.getInt("leave_balance"));
	                emp.setLeaveTaken(rs.getInt("leave_taken"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return emp;
	}
	
}
