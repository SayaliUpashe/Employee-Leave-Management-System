<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HR Dashboard - Employee Management System</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
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
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            justify-content: center;
        }
        .card {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
            text-align: center;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.4);
        }
        .card h3 {
            margin-bottom: 10px;
            color: #00c3ff;
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
            transition: 0.3s ease;
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
            <h1>Welcome, HR</h1>
            <p>Oversee payroll and leave requests effectively</p>
            <p><strong>Logged in as:</strong> ${sessionScope.userRole}</p>
        </div>

        <div class="card-grid">
            <div class="card" onclick="location.href='PayrollServlet?action=managePayroll'">
                <h3>Manage Payroll</h3>
                <p>Process employee salaries and benefits</p>
            </div>
            <div class="card" onclick="location.href='LeaveRequestServlet?action=viewLeaveRequests'">
                <h3>Approve Leave Requests</h3>
                <p>Review and approve/reject leave applications</p>
            </div>
        </div>
    </div>

</body>
</html>
