<jsp:useBean id="emp" class="com.employee.model.Employee" scope="request"></jsp:useBean>
<%-- <jsp:setProperty property="*" name="emp"/> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.employee.dao.EmployeeDAO" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.Date" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Employee Registration</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet"/>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: linear-gradient(135deg, #667eea, #764ba2);
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .form-container {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(15px);
      border-radius: 20px;
      padding: 30px;
      width: 80%;
      max-width: 800px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
      color: #fff;
      animation: fadeIn 1.2s ease-in-out;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(-30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
      font-size: 2rem;
    }

    form {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 20px;
    }

    .form-group {
      display: flex;
      flex-direction: column;
    }

    .form-group label {
      margin-bottom: 5px;
      font-weight: 500;
    }

    .form-group input,
    .form-group select {
      padding: 10px;
      border: none;
      border-radius: 10px;
      background: rgba(255, 255, 255, 0.8);
      transition: all 0.3s ease;
    }

    .form-group input:focus,
    .form-group select:focus {
      outline: none;
      box-shadow: 0 0 10px #764ba2;
    }

    .form-group input:hover,
    .form-group select:hover {
      transform: scale(1.02);
    }

    .full-width {
      grid-column: 1 / 3;
    }

    .submit-btn {
      background: #764ba2;
      color: #fff;
      border: none;
      padding: 15px;
      border-radius: 12px;
      cursor: pointer;
      transition: background 0.3s ease, transform 0.2s;
    }

    .submit-btn:hover {
      background: #5b3d91;
      transform: scale(1.05);
    }

    @media (max-width: 768px) {
      form {
        grid-template-columns: 1fr;
      }

      .full-width {
        grid-column: 1 / 2;
      }
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>Register New Employee</h2>
    <form action="EmployeeRegister.jsp" method="post">
      <div class="form-group">
        <label>First Name</label>
        <input type="text" name="first_name" required />
      </div>
      <div class="form-group">
        <label>Last Name</label>
        <input type="text" name="last_name" required />
      </div>
      <div class="form-group">
        <label>Email</label>
        <input type="email" name="email" required />
      </div>
      <div class="form-group">
        <label>Phone Number</label>
        <input type="text" name="phone_number" required />
      </div>
      <div class="form-group">
        <label>Date of Birth</label>
        <input type="date" name="dob" required />
      </div>
      <div class="form-group">
        <label>Gender</label>
        <select name="gender" required>
          <option value="">Select</option>
          <option>Male</option>
          <option>Female</option>
          <option>Other</option>
        </select>
      </div>
      <div class="form-group">
        <label>Job Title</label>
        <input type="text" name="job_title" required />
      </div>
      <div class="form-group">
        <label>Department</label>
        <input type="text" name="department" required />
      </div>
      <div class="form-group">
        <label>Employee Type</label>
        <select name="employee_type" required>
          <option value="">Select</option>
          <option>Full-time</option>
          <option>Part-time</option>
          <option>Contract</option>
          <option>Intern</option>
        </select>
      </div>
      <div class="form-group">
        <label>Date of Joining</label>
        <input type="date" name="date_of_joining" required />
      </div>
      <div class="form-group">
        <label>Username</label>
        <input type="text" name="username" required />
      </div>
      <div class="form-group">
        <label>Password</label>
        <input type="password" name="password" required />
      </div>
      <div class="form-group">
        <label>Role</label>
        <select name="role" required>
          <option value="">Select</option>
          <option>Admin</option>
          <option>HR</option>
          <option>Manager</option>
          <option>Employee</option>
        </select>
      </div>
      <div class="form-group full-width">
        <button type="submit" class="submit-btn">Register Employee</button>
      </div>
    </form>
  </div>
  <%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
        // Read parameters
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone_number"); // KEEP as String

        // Convert date strings to java.sql.Date
        Date dob = Date.valueOf(request.getParameter("dob"));
        Date dateOfJoining = Date.valueOf(request.getParameter("date_of_joining"));

        String gender = request.getParameter("gender");
        String jobTitle = request.getParameter("job_title");
        String department = request.getParameter("department");
        String employeeType = request.getParameter("employee_type");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Hash the password
        String hashPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Set to bean (emp)
        emp.setFirstName(firstName);
        emp.setLastName(lastName);
        emp.setEmail(email);
        emp.setPhoneNumber(phone); // Keep this a String
        emp.setDob(dob);
        emp.setGender(gender);
        emp.setJobTitle(jobTitle);
        emp.setDepartment(department);
        emp.setEmployeeType(employeeType);
        emp.setDateOfJoining(dateOfJoining);
        emp.setUsername(username);
        emp.setPassword(hashPassword); // Use corrected variable name
        emp.setRole(role);

        // Insert into DB
        boolean status = EmployeeDAO.addEmployee(emp);

        if (status) {
%>
            <p style="color: lime; text-align:center;">✅ Employee registered successfully!</p>
<%
        } else {
%>
            <p style="color: red; text-align:center;">❌ Failed to register employee.</p>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <p style="color: orange; text-align:center;">⚠️ Error: <%= e.getMessage() %></p>
<%
    }
}
%>

  
</body>
</html>

  

