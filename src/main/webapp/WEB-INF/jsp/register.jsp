<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="styles.css">

</head>
<body>

<!-- This is a comment -->

<h1 class="center">Register</h1>

<p id="para1" class="center large">Please register a New Account:</p><br>

<h2>${error}</h2>

<form action="register-new" method="post">
    <label for="name">User-name:</label>
    <input type="text" id="username" name="username" required><br><br>
    <label for="password">Password:</label>
    <input type="text" id="password" name="password" required><br><br>
    <label for="email">Email:</label>
    <input type="text" id="email" name="email" required><br><br>
    <button>Submit</button>
</form>
</body>
</html>