<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.UserModel" %>
    <%@ page import="utils.StringUtils" %>
    <% HttpSession emailsession = request.getSession(); 
 String currentUser = (String) emailsession.getAttribute("username");
 String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheet/Profile.css">
    </head>
<body>
  <header>
  <nav class="container">
			<div class="logo">
				<img src="<%= contextPath%>/images/home images/logo.png"
					alt="Company Logo">
			</div>
			<ul class="navigation">
				<li><a href="<%= contextPath%>/products">Home</a></li>
				<li><a href="<%= contextPath%>/SendMessageServlet">About Us</a></li>
				<li><a href="#">Profile</a></li>
				<li><form action="<%
                    if (currentUser != null) {
                        out.print(contextPath + StringUtils.SERVLET_URL_LOGOUT);
                    } else {
                        out.print(contextPath + StringUtils.PAGE_URL_LOGIN);
                    }
                %>" method="post">
                    <input type="submit" value="<%
                        if (currentUser != null) {
                            out.print(StringUtils.LOGOUT);
                        } else {
                            out.print(StringUtils.LOGIN);
                        }
                    %>"/>
                </form></li>
				<li class="search-bar">
					<form action="<%= request.getContextPath() %>/SearchServlet"
						method="get">
						<input type="text" name="query" placeholder="Search...">
						<button type="submit">Search</button>
					</form>
				</li>
				<li>
					<!-- Cart Icon --> <a
					href="<%=request.getContextPath()%>/CartServlet" class="cart-icon">
						<img src="<%= contextPath%>/images/home images/cart.png"
						alt="Cart Icon">
				</a>
				</li>
			</ul>
		</nav>
    </header>

  <main>
    <input type="radio" name="tab" id="profile-tab" checked>
    <label for="profile-tab" class="tab-button">My Profile</label>
    <input type="radio" name="tab" id="password-tab">
    <label for="password-tab" class="tab-button">Update Profile</label>
    <div class="tab-content">
        <div id="profile" class="tab active">
                <%
                UserModel user = (UserModel) request.getAttribute("user");
                    if (user != null) {
                %>
                <p>User ID: <%= user.getUserId() %></p>
                <p>User Name: <%= user.getUserName() %></p>
                <p>First Name: <%= user.getFirstName() %></p>
                <p>Last Name: <%= user.getLastName() %></p>
                <p>Address: <%= user.getAddress() %></p>
                <p>Phone Number: <%= user.getPhoneNumber() %></p>
                <p>Email: <%= user.getEmail() %></p>
                <% } else { %>
                <p>User information not found.</p>
                <% } %>
            </div>
      <div id="password" class="tab">
        <form action="../ProfileUpdateServlet" method="get">
          <label for="user-Id">User ID:</label>
          <input type="text" id="user-Id" name="user-Id">
		  <label for="user-name">User Name:</label>
          <input type="text" id="user-name" name="user-name">
          <label for="first-name">First Name:</label>
          <input type="text" id="first-name" name="first-name">
          <label for="last-name">Last Name:</label>
          <input type="text" id="last-name" name="last-name">
          <label for="email">Email:</label>
          <input type="email" id="email" name="email">
          <label for="phone">Phone Number:</label>
          <input type="tel" id="phone" name="phone">
          <label for="address">Address:</label>
          <input type="text" id="address" name="address">
          <button type="submit">Update</button>
        </form>
      </div>
    </div>
  </main>
<section class=ifooter>
  <footer>
    <p>&copy; 2024 Galaxy Retailer. All rights reserved.</p>
  </footer>
  </section>
</body>
</html>