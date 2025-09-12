package com.employee.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.LeaveDAO;
import com.employee.model.Employee;
import com.employee.model.Leave;

@WebServlet("/LeaveRequestServlet")
public class LeaveRequestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	System.out.println("Leave Servlet of doGet Method ");
        List<Leave> leaveList = LeaveDAO.getPendingRequests();
        request.setAttribute("leaveList", leaveList);
        request.getRequestDispatcher("LeaveRequest.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    	System.out.println("Leave Servlet of doPost Method ");
        int leaveId = Integer.parseInt(request.getParameter("leaveId"));
        String action = request.getParameter("action"); // approve or reject
        Employee emp = (Employee) request.getSession().getAttribute("employee");
        if (emp == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
 
        if ("approve".equals(action)) {
            LeaveDAO.updateLeaveStatus(leaveId, "Approved", emp.getEmployeeId());
            
        } else if ("reject".equals(action)) {
            LeaveDAO.updateLeaveStatus(leaveId, "Rejected", emp.getEmployeeId());
        }

        response.sendRedirect("LeaveRequestServlet");
    }

}
