<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mark Attendance</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(0,0,0,0.2);
            width: 420px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 10px 14px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 15px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #4CAF50;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background: #43a047;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Mark Employee Attendance</h2>
    <form action="AttendanceServlet" method="post">
        <label for="employeeId">Employee ID:</label>
        <input type="number" id="employeeId" name="employeeId" required>

        <label for="attendanceDate">Attendance Date:</label>
        <input type="date" id="attendanceDate" name="attendanceDate" required>

        <label for="checkInTime">Check-In Time:</label>
        <input type="time" id="checkInTime" name="checkInTime" required>

        <label for="checkOutTime">Check-Out Time:</label>
        <input type="time" id="checkOutTime" name="checkOutTime" required>

        <label for="status">Status:</label>
        <select name="status" id="status" required>
            <option value="">-- Select Status --</option>
            <option value="Present">Present</option>
          <!--   <option value="Absent">Absent</option> -->
            <option value="On Leave">On Leave</option>
            <option value="Half Day">Half Day</option>
        </select>

        <button type="submit">Submit Attendance</button>
    </form>
</div>

</body>
</html>
