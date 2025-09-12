<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Manage Payroll</title>
    <style>
        body {
            font-family: Arial;
            background: #1e1e2f;
            color: #fff;
        }
        .form-container {
            max-width: 700px;
            margin: auto;
            background: rgba(255,255,255,0.1);
            padding: 30px;
            margin-top: 50px;
            border-radius: 10px;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 6px;
            border: none;
        }
        button {
            background: #00c6ff;
            color: white;
            border: none;
            padding: 12px 25px;
            cursor: pointer;
            border-radius: 8px;
        }
        button:hover {
            background: #008ecc;
        }
    </style>
</head>
<body>
	<script>
    window.onload = function() {
        const today = new Date().toISOString().split('T')[0];
        document.getElementById("paymentDate").value = today;
    };
</script>
	

    <div class="form-container">
        <h2>Assign Payroll Details</h2>
        <form action="PayrollServlet" method="post">
            <label>Employee ID:</label>
            <select name="employeeId">
                <c:forEach var="emp" items="${employeeList}">
                    <option value="${emp.employeeId}">${emp.firstName} ${emp.lastName} (ID: ${emp.employeeId})</option>
                </c:forEach>
            </select>

            <label>Salary:</label>
            <input type="number" name="salary" required>

            <label>Tax Deductions:</label>
            <input type="number" name="taxDeductions" required>

            <label>Bank Account Number:</label>
            <input type="number" name="bankAccount" required>
            
           <!--  <label>Net Salary:</label>
            <input type="number" name="netSalary" required> -->

            <label>Payment Date:</label>
            <input type="date" name="paymentDate" id="paymentDate" required>

            <button type="submit">Submit Payroll</button>
        </form>
    </div>
	
</body>
</html>
