package com.employee.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.employee.model.Payroll;

public class PayrollDAO {
	
	public static final String URL ="jdbc:mysql://localhost:3306/employeeleavemanagement";
	public static final String USER ="root";
	public static final String PASSWORD ="Saurabh@123";
	
	public static Connection getConnection() throws SQLException
	{
		return DriverManager.getConnection(URL,USER,PASSWORD);
	}
	
	public static boolean salarySend(int employeeid, double salary,double taxD, long bankaccount, Date paymentdate)
	{
		boolean status = false;
		String query = "INSERT INTO payroll (employee_id, salary, bank_account, tax_deductions, payment_date) VALUES (?,?,?,?,?)";
		try(Connection conn = getConnection();PreparedStatement ps = conn.prepareStatement(query))
		{
			ps.setInt(1, employeeid);
			ps.setDouble(2, salary);
			ps.setLong(3, bankaccount);
			ps.setDouble(4, taxD);
			/* ps.setDouble(5, netsalary); */
			ps.setDate(5, paymentdate);
			int row = ps.executeUpdate();
			if(row > 0)
			{
				status = true;
			}
			
			System.out.println("INSERTING: empId=" + employeeid + ", salary=" + salary + ", bank=" + bankaccount + ", tax=" + taxD + ", date=" + paymentdate);

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public static Payroll getPaymentDetails()
	{
		Payroll pay = null;
		String query = "SELECT * FROM payroll";
		try(Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(query))
		{
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			    pay = new Payroll();
				pay.setEmployeeId(rs.getInt("employee_id"));
				pay.setSalary(rs.getDouble("salary"));
				pay.setTaxDeductions(rs.getDouble("tax_deductions"));
				pay.setNetSalary(rs.getDouble("net_salary"));
				pay.setBankAccount(rs.getLong("bank_account"));
				pay.setPaymentDate(rs.getDate("payment_date"));

			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return pay;
	}
	
	
	public static Payroll getPayrollByEmployeeId(int employeeId) {
	    Payroll payroll = null;
	    String query = "SELECT * FROM payroll WHERE employee_id = ?";
	    
	    try (Connection conn = getConnection(); 
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	        ps.setInt(1, employeeId);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            payroll = new Payroll();
	            payroll.setEmployeeId(rs.getInt("employee_id"));
	            payroll.setSalary(rs.getDouble("salary"));
	            payroll.setTaxDeductions(rs.getDouble("tax_deductions"));
	            payroll.setNetSalary(rs.getDouble("net_salary"));
	            payroll.setBankAccount(rs.getLong("bank_account"));
	            payroll.setPaymentDate(rs.getDate("payment_date"));
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return payroll;
	}

	
}
