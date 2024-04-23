<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Registration page</title>
	<link rel="stylesheet" type="text/css" href="../stylesheets/register.css" />
</head>
<body>
	<div class="container">
        <h1>Registration Form</h1>
        <form action="../RegisterServlet" method="post">
    <div class="row">
        <div class="col">
            <label for="firstName">First Name:</label>
            <input class="input-field" type="text" id="firstName" name="firstName" required>
        </div>
        <div class="col">
            <label for="lastName">Last Name:</label>
            <input class="input-field" type="text" id="lastName" name="lastName" required>
        </div>
    </div>
   
    <div class="row">
        <div class="col">
            <label for="userName">User Name:</label>
            <input class="input-field" type="text" id="userName" name="userName" required>
        </div>
        <div class="col">
            <label for="address">Address:</label>
            <input class="input-field" type="text" id="address" name="address" required>
        </div>
    </div>
    
    <div class="row">
        <div class="col">
            <label for="email">Email:</label>
            <input class="input-field" type="email" id="email" name="email" required>
        </div>
        <div class="col">
            <label for="phoneNumber">Phone Number:</label>
            <input class="input-field" type="tel" id="phoneNumber" name="phoneNumber" required>
        </div>
    </div>
    
    <div class="row">
        <div class="col">
            <label>Gender:</label>
            <div class ="row1">
                <div>
                    <input type="radio" id="male" name="gender" value="male" required>
                    <label for="male">Male</label>
                </div>
                <div>
                    <input type="radio" id="female" name="gender" value="female">
                    <label for="female">Female</label>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col">
            <label for="password">Password:</label>
            <input class="input-field" type="text" id="password" name="password" required>
        </div>
        <div class="col">
            <label for="confirmPassword">Confirm Password:</label>
            <input class="input-field" type="text" id="confirmPassword" name="confirmPassword" required>
        </div>
    </div>
    
    <%-- <button class="register-btn" type="register">Register</button> --%>
    <input class="register-btn" type="submit" value="Register"/>
</form>

    </div>
</body>
</html>
	<div class = "container">
		<%-- display error message if it exits --%>
		<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		if (errorMessage != null && !errorMessage.isEmpty()){
		%>
		<p class="error-message"><%=errorMessage%></p>
		<%
		}
		%>
	</div>


