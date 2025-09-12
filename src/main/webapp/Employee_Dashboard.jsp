<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.employee.model.Employee" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>
    <style>
@import url('https://fonts.googleapis.com/css2?family=Rubik:wght@400;600&display=swap');

body {
    font-family: 'Rubik', sans-serif;
    background: linear-gradient(to right, #5c3d35, #d1b59e); /* Rich Brown to Cream */
    color: #fff;
    margin: 0;
    padding: 40px 20px;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    animation: fadeInBody 1.5s ease-out;
}

.dashboard {
    max-width: 900px;
    width: 100%;
    margin: auto;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 18px;
    padding: 40px 50px;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
    backdrop-filter: blur(8px);
    animation: slideUp 0.8s ease-out;
}

h2 {
    text-align: center;
    color: #5c3d35; /* Rich Brown */
    margin-bottom: 30px;
    font-size: 36px;
    letter-spacing: 2px;
    font-weight: bold;
}

.buttons {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-bottom: 35px;
}

.buttons a,
.buttons button {
    padding: 16px 32px;
    font-size: 18px;
    font-weight: 500;
    color: #fff;
    background: #7a4d3d; /* Mahogany */
    border: none;
    border-radius: 15px;
    text-decoration: none;
    cursor: pointer;
    transition: all 0.4s ease-in-out;
    box-shadow: 0 6px 20px rgba(122, 77, 61, 0.2);
}

.buttons a:hover,
.buttons button:hover {
    background: #5c3d35; /* Rich Brown */
    transform: scale(1.05);
    box-shadow: 0 8px 25px rgba(92, 61, 53, 0.3);
}

.info {
    display: none;
    background: rgba(255, 255, 255, 0.15);
    border-left: 6px solid #5c3d35; /* Rich Brown */
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    color: #f0f0f0;
    animation: fadeIn 0.5s ease-in-out;
}

.info h3 {
    font-size: 22px;
    margin-bottom: 15px;
    color: #5c3d35; /* Rich Brown */
}

.info p {
    margin: 8px 0;
    font-size: 16px;
    color: #f0f0f0;
    font-weight: 400;
}

@keyframes fadeInBody {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}


    </style>

    <script>
        function toggleDetails() {
            var details = document.getElementById("empDetails");
            details.style.display = (details.style.display === "none") ? "block" : "none";
        }
    </script>
</head>
<body>

<c:set var="emp" value="${employee}" />

<div class="dashboard">
    <h2>Welcome, ${emp.firstName} ${emp.lastName}</h2>

    <div class="buttons">
        <button onclick="toggleDetails()">View My Details</button>
        <a href="ApplyForLeave.jsp">Apply for Leave</a>
        <a href="checkBalanceServlet">Check Leave Balance</a>
        <a href="EmployeeAttendance.jsp">Attendance</a>
        <a href="PayrollServlet?action=payment">View Payroll</a>
        <a href="index.html">Logout</a>
    </div>

    <div id="empDetails" class="info">
        <h3>Your Details</h3>
        <p><strong>Email:</strong> ${emp.email}</p>
        <p><strong>Phone:</strong> ${emp.phoneNumber}</p>
        <p><strong>Department:</strong> ${emp.department}</p>
        <p><strong>Job Title:</strong> ${emp.jobTitle}</p>
        <p><strong>Date of Joining:</strong> ${emp.dateOfJoining}</p>
        <p><strong>Role:</strong> ${emp.role}</p>
    </div>
</div>

</body>
</html>
