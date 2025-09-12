<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.util.List" %>
<%-- %
    List Employeelist = (List) request.getAttribute("employeeList");
	if(Employeelist == null) {
		out.println("🚨 Employee list is NULL saurabh");
	} else {
		out.println("✅ Employee list size: " + Employeelist.size());
	}
%>
 --%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Roles & Access</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('your-background.jpg') no-repeat center center/cover;
            backdrop-filter: blur(8px);
            color: #fff;
        }

        .container {
            max-width: 95%;
            margin: 40px auto;
            padding: 20px;
            background: rgba(0, 0, 0, 0.6);
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #00ffe0;
            text-shadow: 0 0 5px #00ffe0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        th {
            background-color: rgba(0, 0, 0, 0.5);
            color: #00ffe0;
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transition: 0.3s;
        }

        select, input[type="hidden"], button {
            padding: 8px 12px;
            border-radius: 8px;
            border: none;
            font-size: 14px;
            outline: none;
        }

        select {
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        select option {
            color: #000;
        }

        button {
            background-color: #00ffe0;
            color: #000;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        button:hover {
            background-color: #00c2a8;
            transform: scale(1.05);
        }

        .status-active {
            color: #00ff88;
            font-weight: bold;
        }

        .status-inactive {
            color: #ff4c4c;
            font-weight: bold;
        }

        @media screen and (max-width: 768px) {
            table, tr, td, th {
                font-size: 12px;
                padding: 8px;
            }
            select, button {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Manage User Roles & Access</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Change Role</th>
            <th>Status</th>
            <th>Change Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="emp" items="${employeeList}">
			    <form action="AdminServlet" method="post">
			        <tr>
			            <td>${emp.employeeId}</td>
			            <td>${emp.firstName} ${emp.lastName}</td>
			            <td>${emp.email}</td>
			            <td>${emp.role}</td>
			            <td>
			               <select name="newRole">
							    <option value="Employee" ${emp.role == 'Employee' ? 'selected' : ''}>Employee</option>
							    <option value="Manager" ${emp.role == 'Manager' ? 'selected' : ''}>Manager</option>
							    <option value="HR" ${emp.role == 'HR' ? 'selected' : ''}>HR</option>
							    <option value="Admin" ${emp.role == 'Admin' ? 'selected' : ''}>Admin</option>
							</select>

			            </td>
			            <%-- <td class="${emp.active ? 'status-active' : 'status-inactive'}">
			                ${emp.active ? 'Active' : 'Inactive'}
			            </td> --%>
			            <td class="${emp.employeeStatus == 'Active' ? 'status-active' : 'status-inactive'}">
   								 ${emp.employeeStatus}
						</td>
			            
			            <td>
			                <select name="newStatus">
			                    <%-- <option value="true" ${emp.active ? 'selected' : ''}>Active</option>
			                    <option value="false" ${!emp.active ? 'selected' : ''}>Inactive</option> --%>
			                    
			                    <option value="Active" ${emp.employeeStatus == 'Active' ? 'selected' : ''}>Active</option>
								<option value="Inactive" ${emp.employeeStatus == 'Inactive' ? 'selected' : ''}>Inactive</option>
			                    
			                </select>
			            </td>
			            <td>
			                <input type="hidden" name="employeeId" value="${emp.employeeId}" />
			                <button type="submit" name="action" value="updateRole">Update</button>
			            </td>
			        </tr>
			    </form>
			</c:forEach>

    </table>
</div>
</body>
</html>
