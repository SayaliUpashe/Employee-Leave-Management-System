<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%-- <%
    String userRole = (String) session.getAttribute("userRole");
    if (userRole == null || !userRole.equals("admin")) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
 --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Employee Management System</title>
    <link rel="stylesheet" href="styles/admin_dashboard.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #141e30, #243b55);
            color: #fff;
        }
        .dashboard-container {
            padding: 40px;
        }
        .dashboard-header {
            text-align: center;
            margin-bottom: 40px;
        }
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }
        .card {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            text-align: center;
        }
        .card:hover {
            transform: scale(1.03);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.4);
        }
        .card h3 {
            margin-bottom: 10px;
            color: #00d4ff;
        }
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 30px;
            background: #ff4b5c;
            padding: 10px 20px;
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }
        .logout-btn:hover {
            background: #ff1f36;
        }
    </style>
</head>
<body>

    <button class="logout-btn" onclick="location.href='LogoutServlet'">Logout</button>

    <div class="dashboard-container">
        <div class="dashboard-header">
            <h1>Welcome, Admin</h1>
            <p>Manage your organization efficiently</p>
            <p><strong>Logged in as:</strong> ${sessionScope.userRole}</p>
        </div>

        <div class="card-grid">
            <div class="card" onclick="location.href='AdminServlet?action=manageEmployees'">
                <h3>Manage Employees</h3>
                <p>Add, update, delete employee records</p> 
            </div>
            <div class="card" onclick="location.href='AdminServlet?action=manageRoles'">
                <h3>Manage Users & Roles</h3>
                <p>Assign roles and manage user access</p>
            </div>
           <!--  <div class="card" onclick="location.href='AdminServlet?action=viewLeaveRequests'">
                <h3>Leave Requests</h3>
                <p>View and override all leave requests</p>
            </div> -->
            <!-- <div class="card" onclick="location.href='PayrollServlet?action=managePayroll'">
                <h3>Employee PayRoll</h3>
                <p>Assign and Manage Salary</p>
            </div> -->
            <div class="card" onclick="location.href='holiday_settings.jsp'">
                <h3>Leave & Holiday Settings</h3>
                <p>Configure global leave types and calendars</p>
            </div>
        </div>
    </div>

</body>
</html>
