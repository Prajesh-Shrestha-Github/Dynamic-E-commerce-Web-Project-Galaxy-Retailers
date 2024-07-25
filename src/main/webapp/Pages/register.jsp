
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Page</title>
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/stylesheets/register.css" />
</head>
<body>
    <div class="container">
        <h1>Registration Form</h1>
        <%-- Display error message if username already exists --%>
        <% if(request.getAttribute("errorMessage") != null) { %>
            <p style="color: red;"><%=request.getAttribute("errorMessage")%></p>
        <% } %>
        
        
        <form action="<%=contextPath%>/RegisterServlet" method="post">
            <!-- Form fields -->
            <div class="row">
                <!-- First Name and Last Name fields -->
                <div class="col">
                    <label for="firstName">First Name:</label>
                    <input class="input-field" type="text" id="firstName" name="firstName" required>
                </div>
                <div class="col">
                    <label for="lastName">Last Name:</label>
                    <input class="input-field" type="text" id="lastName" name="lastName" required>
                </div>
            </div>
            <!-- Other form fields -->
            <div class="row">
                <!-- Username and Address fields -->
                <div class="col">
                    <label for="userName">User Name:</label>
                    <input class="input-field" type="text" id="userName" name="userName" required>
                </div>
                <div class="col">
                    <label for="address">Address:</label>
                    <input class="input-field" type="text" id="address" name="address" required>
                </div>
            </div>
            <!-- Email and Phone Number fields -->
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
            <!-- Password and Confirm Password fields -->
            <div class="row">
                <div class="col">
                    <label for="password">Password:</label>
                    <input class="input-field" type="password" id="password" name="password" required>
                </div>
                <div class="col">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input class="input-field" type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
            </div>
            <!-- Register button -->
            <input class="register-btn" type="submit" value="Register"/>
        </form>
        <!-- Hyperlink to login page -->
        <p>Already have an account? <a href="login.jsp">Login</a></p>
        
    </div>
</body>
</html>
