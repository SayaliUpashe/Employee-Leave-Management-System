<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pending Leave Requests</title>
    <style>
        body {
            background: #1e1e2f;
            font-family: Arial, sans-serif;
            color: #fff;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #00ffe0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(0,0,0,0.7);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #555;
        }
        th {
            background-color: #282c34;
        }
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
        .approve { background-color: #28a745; }
        .reject { background-color: #dc3545; }
    </style>
</head>
<body>

    <h2>Pending Leave Requests</h2>

   <%--  <c:if test="${not empty leaveList}"> --%>
        <table>
            <thead>
                <tr>
                    <th>Leave ID</th>
                    <th>Employee ID</th>
                    <th>Leave Type</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Days</th>
                    <th>Applied On</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="leave" items="${leaveList}">
                    <tr>
                        <td>${leave.leaveId}</td>
                        <td>${leave.employeeId}</td>
                        <td>${leave.leaveType}</td>
                        <td>${leave.startDate}</td>
                        <td>${leave.endDate}</td>
                        <td>${leave.leaveDays}</td>
                        <td>${leave.appliedOn}</td>
                        <td>${leave.leaveStatus}</td>
                        <td>
                            <form action="LeaveRequestServlet" method="post" style="display:inline;">
                                <input type="hidden" name="leaveId" value="${leave.leaveId}" />
                                <button type="submit" name="action" value="approve" class="btn approve">Approve</button>
                            </form>
                            <form action="LeaveRequestServlet" method="post" style="display:inline;">
                                <input type="hidden" name="leaveId" value="${leave.leaveId}" />
                                <button type="submit" name="action" value="reject" class="btn reject">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
   <%--  </c:if> --%>

    <c:if test="${empty leaveList}">
        <p>No pending leave requests at the moment.</p>
    </c:if>

</body>
</html>
