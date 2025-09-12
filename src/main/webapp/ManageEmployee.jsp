<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role"); // Must be set during login
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Employees</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #43cea2, #185a9d);
            padding: 40px;
            color: #fff;
        }

        .container {
            display: grid;
            grid-template-columns: 1fr;
            gap: 40px;
            max-width: 1000px;
            margin: auto;
        }

        .form-box {
            background: rgba(255, 255, 255, 0.15);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            backdrop-filter: blur(10px);
        }

        .form-box h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #fff;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: none;
            border-radius: 8px;
            background: rgba(255,255,255,0.9);
            color: #000;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 10px;
            background-color: #000000cc;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #222;
        }

        .action-buttons {
            text-align: center;
            margin-bottom: 30px;
        }

        .action-buttons button {
            margin: 10px;
            width: 150px;
        }

        .hidden {
            display: none;
        }
    </style>

    <script>
        function showForm(formId) {
            document.getElementById("addForm").classList.add("hidden");
            document.getElementById("updateForm").classList.add("hidden");
            document.getElementById("deleteForm").classList.add("hidden");
            document.getElementById(formId).classList.remove("hidden");
        }
    </script>
</head>
<body>
    <h1 style="text-align:center;">Manage Employees</h1>

    <% if ("Admin".equals(role)) { %>
    <div class="action-buttons">
        <button onclick="showForm('addForm')">Add Employee</button>
        <button onclick="showForm('updateForm')">Update Employee</button>
        <button onclick="showForm('deleteForm')">Delete Employee</button>
    </div>

    <div class="container">
        <!-- Add Employee Form -->
        <div class="form-box hidden" id="addForm">
            <h2>Add Employee</h2>
            <form action="AdminServlet" method="post">
                <label>First Name:</label>
                <input type="text" name="firstName" required>

                <label>Last Name:</label>
                <input type="text" name="lastName" required>

                <label>Email:</label>
                <input type="email" name="email" required>

                <label>Phone Number:</label>
                <input type="text" name="phoneNumber" required>

                <label>Date of Birth:</label>
                <input type="date" name="dob" required>

                <label>Gender:</label>
                <select name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>

                <label>Job Title:</label>
                <input type="text" name="jobTitle" required>

                <label>Department:</label>
                <input type="text" name="department" required>

                <label>Employee Type:</label>
                <select name="employeeType" required>
                    <option value="Full-Time">Full-Time</option>
                    <option value="Part-Time">Part-Time</option>
                    <option value="Contract">Contract</option>
                </select>

                <label>Date of Joining:</label>
                <input type="date" name="dateOfJoining" required>

                <label>Username:</label>
                <input type="text" name="username" required>

                <label>Password:</label>
                <input type="password" name="password" required>

                <label>Role:</label>
                <select name="role" required>
                    <option value="Employee">Employee</option>
                    <option value="Manager">Manager</option>
                    <option value="HR">HR</option>
                </select>
                <button type="submit" name="action" value="add">Add Employee</button>
            </form>
        </div>

        <!-- Update Employee Form -->
        <div class="form-box hidden" id="updateForm">
		    <h2>Update Employee</h2>
		    <form action="AdminServlet" method="post">
		        <label>Employee ID:</label>
		        <input type="number" name="id" >
		
		        <label>First Name:</label>
		        <input type="text" name="firstName" >
		
		        <label>Last Name:</label>
		        <input type="text" name="lastName" >
		
		        <label>Email:</label>
		        <input type="email" name="email" >
		
		        <label>Phone Number:</label>
		        <input type="text" name="phoneNumber" >
		
		        <label>Date of Birth:</label>
		        <input type="date" name="dob" >
		
		        <label>Gender:</label>
		        <select name="gender" >
		            <option value="">Select</option>
		            <option value="Male">Male</option>
		            <option value="Female">Female</option>
		            <option value="Other">Other</option>
		        </select>
		
		        <label>Job Title:</label>
		        <input type="text" name="jobTitle" >
		
		        <label>Department:</label>
		        <input type="text" name="department" >
		
		        <label>Employee Type:</label>
		        <select name="employeeType" >
		            <option value="">Select</option>
		            <option value="Full-Time">Full-Time</option>
		            <option value="Part-Time">Part-Time</option>
		            <option value="Contract">Contract</option>
		        </select>
		
		        <label>Date of Joining:</label>
		        <input type="date" name="dateOfJoining">
		
		        <label>Username:</label>
		        <input type="text" name="username" >
		
		        <label>Role:</label>
		        <select name="role" >
		            <option value="">Select</option>
		            <option value="Employee">Employee</option>
		            <option value="Manager">Manager</option>
		            <option value="HR">HR</option>
		        </select>
		
		        <button type="submit" name="action" value="update">Update Employee</button>
		    </form>
		</div>

        <!-- Delete Employee Form -->
        <div class="form-box hidden" id="deleteForm">
            <h2>Delete Employee</h2>
            <form action="AdminServlet" method="post">
                <label>Employee ID to Delete:</label>
                <input type="number" name="id" required>
                <button type="submit" name="action" value="delete">Delete Employee</button>
            </form>
        </div>
    </div>
    <% } else { %>
        <h2 style="text-align:center; color: yellow;">Access Denied: Only Admin can manage employees.</h2>
    <% } %>
</body>
</html>
