<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>

<!-- This is a comment -->

<h1 class="center">Login</h1>

<p id="para1" class="center large">Please enter your user-name and password:</p>

<form action="login" method="post">
    <label>User-name:</label>
    <input type="text" id="username" name="username"><br><br>
    <label>Password:</label>
    <input type="text" id="password" name="password"><br><br>
    <button>Submit</button><br>
</form>

<form action="register" method="get">
	<a href="register_New"><button name="register_Btn">Register New User</button></a>
</form>

</body>
</html>