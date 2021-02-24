<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<h1>Please edit the following information</h1>
		<form action="update-task" method='POST'>
		<br>
		<input type="hidden" id="id" name="id" value="${task.id}">
		<input type="hidden" id="id" name="id" value="${task.username}">
		<label>Startdate: </label> 
		<input type="date" id="startdate" name="startdate" required><br> 
		<label>Enddate: <font color="grey">[-Current: ${task.endDate} ]</font></label> 
		<input type="date" id="enddate" name="enddate" required><br> 
		<label>Description: <font color="grey">[-Current: ${task.description} ]</font></label>
		<input type="text" id="description" name="description" required><br>
		<label>Email: <font color="grey">[-Current: ${task.email} ]</font></label> 
		<input type="text" id="email" name="email"><br> 
		<label>severity: <font color="grey">[-Current: ${task.severity} ]</font></label>
		<input type="text" id="severity" name="severity"  required><br>
		<button>submit</button>
		<br>
	</form>
	<a href="/"><button>return</button></a>
</body>
</html>