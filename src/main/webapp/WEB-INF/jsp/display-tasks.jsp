<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Manager</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- Start Styles. Move the 'style' tags and everything between them to between the 'head' tags -->
<style type="text/css">
.myTable {
	background-color: #fff;
	border-collapse: collapse;
}

.myTable th {
	background-color: #555;
	color: white;
	width: 50%;
}

.myTable td, .myTable th {
	padding: 5px;
	border: 1px solid #000;
}
</style>
<!-- End Styles -->

</head>
<body>

	<h3>Task Manager</h3>
	<h3>User: <font color="blue">${username}</font></h3>
	<h5 align="center">View your tasks here</h5>

	<c:forEach var="task" items="${tasks}">
		<table class="myTable">
			<tr>
				<th style="padding: 0 15px 0 15px;">Description</th>
				<th style="padding: 0 15px 0 15px;">Email</th>
				<th style="padding: 0 15px 0 15px;">Severity</th>
				<th style="padding: 0 15px 0 15px;">Start Date</th>
				<th style="padding: 0 15px 0 15px;">End Date</th>
				<th style="padding: 0 15px 0 15px;">Click to Edit</th>
				<th style="padding: 0 15px 0 15px;">Click to Complete</th>
				
			</tr>
			<tr>
				<td style="padding: 0 15px 0 15px;">${task.description}</td>
				<td style="padding: 0 15px 0 15px;">${task.email}</td>
				<td style="padding: 0 15px 0 15px;">${task.severity}</td>
				<td style="padding: 0 15px 0 15px;">${task.startDate}</td>
				<td style="padding: 0 15px 0 15px;">${task.endDate}</td>
				<td style="padding: 0 15px 0 15px;">
					<form method='POST' action="edit-this-task">
						<input type="hidden" id="id" name="id" value="${task.id}">
						<button type="submit" style="width: 80px;">Edit</button>
					</form>
				</td>
				<td style="padding: 0 15px 0 15px;">
					<form method='POST' action="complete-task">
						<input type="hidden" id="id" name="id" value="${task.id}">
						<button
							onclick="return confirm('Is this task completed? ')"
							type="submit" style="width: 80px;">Complete</button>
					</form>
				</td>
			</tr>
		</table>
	</c:forEach>
	<hr>
	<h3>Add a new task:</h3>
	<form action="addTask" method='POST'>
		<h3>
			<font color="red">${taskError}</font>
		</h3>
		<input type="hidden" id="username" name="username" value="${username}"><br><br> 
		<label style="padding: 0 4px 0 4px;" for="description"><b>Description:</b></label>
		<input type="text" id="description" name="description" style="width: 500px;" required><br>
		<label style="padding: 0 23px 0 23px;" for="email"><b>Email:</b></label>
		<input type="text" id="email" name="email" required><br>
		<label style="padding: 0 16px 0 15px;" for="severity"><b>Severity:</b>
		</label> <select name="severity">
			<option value="low" selected>low</option>
			<option value="active">active</option>
			<option value="critical">critical</option>
		</select><br>
		<label style="padding: 0 11px 0 12px;" for="startDate"><b>Startdate:</b></label>
		<input type="date" id="startdate" name="startdate" required> 
		<label style="padding: 0 15px 0 14px;" for=enddate><b>Enddate:</b></label> 
		<input type="date" id="enddate" name="enddate" required><br> 
		<button type="submit" class="btn btn-primary btn-block">submit</button>

		<br>
	</form>
	<br>
	<a href="/logout"><button style="height: 40px; width: 100px">logout</button></a>

</body>
</html>