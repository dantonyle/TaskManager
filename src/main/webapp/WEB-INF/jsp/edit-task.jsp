<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Task</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<h3>Please edit the following information for Task ${task.id} </h3>
	<form action="update-task" method='POST'>
		<br>
		<input type="hidden" id="id" name="id" value="${task.id}">
		<input type="hidden" id="id" name="id" value="${task.username}">
		<label>Description: <font color="grey">[-Current: ${task.description} ]</font></label><br>
		<input type="text" id="description" name="description" style="width: 90%" required><br>
		<label>Email: <font color="grey">[-Current: ${task.email} ]</font></label> <br>
		<input type="text" id="email" name="email" required><br> 
		<label>severity: <font color="grey">[-Current: ${task.severity} ]</font></label> <br>
		<select name="severity" required>
			<option value="low" selected>low</option>
			<option value="active">active</option>
			<option value="critical">critical</option>
		</select><br>
		<label>Startdate: <font color="grey">[-Current: ${task.startDate} ]</font></label> <br>
		<input type="date" id="startdate" name="startdate" required><br> 
		<label>Enddate: <font color="grey">[-Current: ${task.endDate} ]</font></label> <br>
		<input type="date" id="enddate" name="enddate" required><br> 
		<br>
		<button>submit</button>
		<br>
	</form>

</body>
</html>