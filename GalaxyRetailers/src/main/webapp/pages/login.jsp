<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="../stylesheets/login.css"> <!-- Link to your CSS file -->
</head>
<body>
    <div class="card">
        <h1 class="header">Galaxy Retailers</h1>
        <form action="">
            <input type="text" placeholder="Username" name="userName" required>
            <input type="password" placeholder="Password" name="password" required>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="register.jsp">Sign Up</a></p>
    </div>
</body>
</html>

