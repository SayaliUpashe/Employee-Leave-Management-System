<%@ page import="com.employee.model.Employee" %>
<%@ page import="com.employee.model.Payroll" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>View Payroll</title>
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

        /* Card-like container for payroll info */
        div.payroll-info {
            background-color: white;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 30px;
            width: 80%;
            max-width: 650px;
            animation: slideIn 1.5s ease-out;
            text-align: left;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        /* Paragraph and label for payroll details */
        p {
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 15px;
            padding: 8px;
            border-radius: 5px;
            background-color: #f9f9f9;
            transition: background-color 0.3s ease;
        }

        p:hover {
            background-color: #ecf0f1;
        }

        strong {
            color: #3498db;
            font-size: 1.1rem;
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
            margin-top: 20px;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        /* Responsive Design for Small Screens */
        @media (max-width: 768px) {
            div.payroll-info {
                grid-template-columns: 1fr; /* Single column layout for small screens */
            }

            button {
                width: 100%; /* Full-width button on small screens */
            }
        }

        /* Animation for fading in and sliding in */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            from {
                transform: translateY(30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

    </style>
</head>

<body>
    <h1>Your Payroll Information</h1>

    <c:choose>
        <c:when test="${not empty payroll}">
            <div class="payroll-info">
                <!-- Display payroll information using EL -->
                <p><strong>Employee ID:</strong> ${payroll.employeeId}</p>
                <p><strong>Salary:</strong> ${payroll.salary}</p>
                <p><strong>Tax Deductions:</strong> ${payroll.taxDeductions}</p>
                <p><strong>Net Salary:</strong> ${payroll.netSalary}</p>
                <p><strong>Bank Account:</strong> ${payroll.bankAccount}</p>
                <p><strong>Payment Date:</strong> ${payroll.paymentDate}</p>

                <!-- Button to download the PDF -->
                <form action="DownloadPaymentPDFServlet" method="get" style="grid-column: span 2;">
                    <input type="hidden" name="employeeId" value="${payroll.employeeId}">
                    <button type="submit">Download PDF Receipt</button>
                </form>
            </div>
        </c:when>
        <c:otherwise>
            <p>No payroll information available.</p>
        </c:otherwise>
    </c:choose>

</body>
</html>
