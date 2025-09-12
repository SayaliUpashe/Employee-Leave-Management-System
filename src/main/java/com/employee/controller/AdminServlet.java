package com.employee.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.AdminDAO;
import com.employee.model.Employee;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String action = request.getParameter("action");

	    if ("manageEmployees".equals(action)) {
	        List<Employee> empList = AdminDAO.getAllEmployee();
	        request.setAttribute("employeeList", empList);
	        request.getRequestDispatcher("ManageEmployee.jsp").forward(request, response);
	    } 
	    else if ("manageRoles".equals(action)) 
	    {
	        List<Employee> empList = AdminDAO.getAllEmployee();
	        request.setAttribute("employeeList", empList);
	        request.getRequestDispatcher("ManageRole.jsp").forward(request, response);
	    } 
		/*
		 * else if ("viewLeaveRequests".equals(action)) { List<Leave> leaveList =
		 * LeaveDAO.getPendingRequests(); request.setAttribute("leaveList", leaveList);
		 * request.getRequestDispatcher("LeaveRequest.jsp").forward(request, response);
		 * }
		 */
	    else {
	        response.sendRedirect("AdminDashBoard.jsp");
	    }
	}

	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		
		String action = request.getParameter("action");
		if("add".equals(action))
		{
			Employee emp = extractEmployee(request);
			AdminDAO.addEmployee(emp);
			response.sendRedirect("ManageEmployee.jsp");
		}
		else if("update".equals(action))
		{
			Employee emp = extractEmployee(request);
			emp.setEmployeeId(Integer.parseInt(request.getParameter("id")));
			AdminDAO.updateEmployee(emp);
			response.sendRedirect("ManageEmployee.jsp");
			
		}
		else if("delete".equals(action))
		{
			int id = Integer.parseInt(request.getParameter("id"));
			AdminDAO.deleteEmployee(id);
			response.sendRedirect("ManageEmployee.jsp");
		}
		else if("updateRole".equals(action)) 
		{
		    int id = Integer.parseInt(request.getParameter("employeeId"));
		    String newrole = request.getParameter("newRole");
		    String newstatus = request.getParameter("newStatus");
		    
		    AdminDAO.updateRole(id, newrole, newstatus);
			response.sendRedirect("AdminServlet");
		}
		
	}
		
	public Employee extractEmployee (HttpServletRequest request) 
	{
	    Employee emp = new Employee();
		emp.setFirstName(request.getParameter("firstName"));
        emp.setLastName(request.getParameter("lastName"));
        emp.setEmail(request.getParameter("email"));
        emp.setPhoneNumber(request.getParameter("phoneNumber"));
        emp.setDob(Date.valueOf(request.getParameter("dob")));
        emp.setGender(request.getParameter("gender"));
        emp.setJobTitle(request.getParameter("jobTitle"));
        emp.setDepartment(request.getParameter("department"));
        emp.setEmployeeType(request.getParameter("employeeType"));
        emp.setDateOfJoining(Date.valueOf(request.getParameter("dateOfJoining")));
        emp.setUsername(request.getParameter("username"));
		emp.setPassword(request.getParameter("password")); 
        emp.setRole(request.getParameter("role"));
        
        return emp;
	}
	
	
}
