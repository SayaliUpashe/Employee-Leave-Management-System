<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.employee.model.Employee" %>
<%@ page session="true" %>

<%-- <%
    Employee emp = (Employee) session.getAttribute("employee");
    if (emp == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%> --%>

<!DOCTYPE html>
<html>
<head>
    <title>Apply for Leave</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(120deg, #667eea, #764ba2);
            color: #fff;
            padding: 40px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            max-width: 600px;
            margin: auto;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(12px);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.8);
            color: #333;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            background-color: #5b3d91;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #472d7a;
        }
    </style>
</head>
<body>
<c:choose>
	<c:when test="${empty employee }">
		<c:redirect url="EmployeeLogin.jsp"></c:redirect>
	</c:when>
</c:choose>

<c:set var="emp" value="${employee}"></c:set>
<div class="form-container">
    <h2>Apply for Leave</h2>

    <form action="ApplyLeaveServlet" method="post">
        <input type="hidden" name="employeeId" value="${emp.getEmployeeId()}"/>

        <label for="leaveType">Leave Type:</label>
        <select name="leaveType" id="leaveType" required>
            <option value="">-- Select --</option>
            <option value="Sick Leave">Sick Leave</option>
            <option value="Casual Leave">Casual Leave</option>
            <option value="Annual Leave">Annual Leave</option>
            <option value="Maternity Leave">Maternity Leave</option>
            <option value="Unpaid Leave">Unpaid Leave</option>
        </select>

        <label for="startDate">Start Date:</label>
        <input type="date" name="startDate" required>

        <label for="endDate">End Date:</label>
        <input type="date" name="endDate" required>

        <!-- <label for="reason">Reason:</label>
        <textarea name="reason" rows="4" required></textarea> -->

        <button type="submit">Submit Leave Application</button>
    </form>
</div>

</body>
</html>
