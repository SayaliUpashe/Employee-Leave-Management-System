<%@ page import="com.employee.model.Employee" %>
<%@ page import="com.employee.dao.EmployeeDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Check Leave Balance</title>
    <style>
        /* General body and background settings */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #f0f8ff, #e0f7fa);
            margin: 0;
            padding: 0;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        /* Title styles */
        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #2c3e50;
            margin-bottom: 40px;
            animation: fadeIn 2s ease-in-out;
        }

        /* Card-like container for leave balance info */
        div.leave-info {
            background-color: white;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 30px;
            width: 80%;
            max-width: 600px;
            text-align: left;
        }

        /* Paragraph for leave balance */
        p {
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 15px;
            padding: 8px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        /* Button styling */
        button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1rem;
            width: 100%;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        /* Animation for fading in */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <h1>Your Leave Balance</h1>

    <c:choose>
        <c:when test="${not empty employee}">
            <div class="leave-info">
                <!-- Display employee's leave balance using EL -->
                <p><strong>Employee Name:</strong> ${employee.firstName} ${employee.lastName}</p>
                <p><strong>Employee ID:</strong> ${employee.employeeId}</p>
                <p><strong>Total Leave:</strong> ${employee.totalLeave} days</p>
                <p><strong>Leave Balance:</strong> ${employee.leaveBalance} days</p>
                <p><strong>Leave Taken:</strong> ${employee.leaveTaken} days</p>
            </div>
        </c:when>
        <c:otherwise>
            <p>No employee information available.</p>
        </c:otherwise>
    </c:choose>

</body>
</html>
