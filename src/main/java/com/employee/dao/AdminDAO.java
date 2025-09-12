package com.employee.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.employee.model.Employee;

public class AdminDAO {

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
		String query = "INSERT INTO employee (first_name,last_name,email,phone_number,dob,gender,job_title,department,employee_type,date_of_joining,username, password_hash, role) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
	
	public static void updateEmployee(Employee emp)
	{
		String query = "UPDATE employee SET first_name = ?,last_name =?,email = ?,phone_number = ?, dob =?, gender = ?,job_title =?, department =?, employee_type=?, date_of_joining=?, username=?, role=? WHERE employee_id = ?";
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
            ps.setString(12, emp.getRole());
            ps.setInt(13, emp.getEmployeeId());
            ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void  deleteEmployee(int id)
	{
		String query = "DELETE FROM employee WHERE employee_id = ?";
		try(Connection conn = getConnection();PreparedStatement ps = conn.prepareStatement(query))
		{
			ps.setInt(1, id);
		    ps.executeUpdate();				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void updateRole(int id, String newRole, String newStatus) 
	{
		 String sql = "UPDATE employee SET role = ?, employee_status = ? WHERE employee_id = ?";
	    try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, newRole);
	        stmt.setString(2, newStatus);
	        stmt.setInt(3, id);
	        stmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	public static List<Employee> getAllEmployee()
	{
		List<Employee> list = new ArrayList<>();
		String query = "SELECT * FROM employee";
		try(Connection conn = getConnection();PreparedStatement ps = conn.prepareStatement(query))
		{
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Employee emp = new Employee();
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setFirstName(rs.getString("first_name"));
		        emp.setLastName(rs.getString("last_name"));
		        emp.setEmail(rs.getString("email"));
		        emp.setPhoneNumber(rs.getString("phone_number"));
		        emp.setDob(rs.getDate("dob"));
		        emp.setGender(rs.getString("gender"));
		        emp.setJobTitle(rs.getString("job_title"));
		        emp.setDepartment(rs.getString("department"));
		        emp.setEmployeeType(rs.getString("employee_type"));
		        emp.setDateOfJoining(rs.getDate("date_of_joining"));
		        emp.setEmployeeStatus(rs.getString("employee_status"));
		        emp.setUsername(rs.getString("username"));
				/* emp.setPassword(request.getParameter("password")); */
		        emp.setRole(rs.getString("role"));
		        list.add(emp);
		        System.out.println("AdminDAO: List size = " + list.size());

			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
}
