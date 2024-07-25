<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="<%= contextPath%>/stylesheets/login.css">
   
</head>
<body>
 
    <div class="outer-container">
        <div class="container">
            <h1>Login</h1>
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
        <p><%= errorMessage %></p>
    <% } %>
            
            <form action="<%=contextPath%>/LoginServlet" method="post">
                <!-- Form fields -->
                <div class="row">
                    <!-- First Name and Last Name fields -->
                    <div class="col">
                        <label for="username">Username:</label>
                        <input class="input-field" type="text" id="username" name="username" required>
                    </div>
                    
                <!-- Password and Confirm Password fields -->
                <div class="row">
                    <div class="col">
                        <label for="password">Password:</label>
                        <input class="input-field" type="password" id="password" name="password" required>
                    </div>
                    
                </div>
                <!-- Register button -->
                <input class="Login-btn" type="submit" value="Login"/>
            </form>
            <!-- Hyperlink to login page -->
            <p>Don't have an account? <a href="register.jsp">Sign up</a></p>
            
        </div>
    </div>
</body>
</html>
