<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="utils.StringUtils" %>
<% HttpSession emailsession = request.getSession(); 
 String currentUser = (String) emailsession.getAttribute("username");
 String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/stylesheets/cart.css" />
</head>
<body>
<body>
	<%
        String esession = (String) session.getAttribute("username");

        String cookieUsername  = null;
        String cookieSessionID = null;
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie cookie: cookies){
                if(cookie.getName().equals(StringUtils.USER)) cookieUsername = cookie.getValue();
                if(cookie.getName().equals(StringUtils.JSESSIONID)) cookieSessionID = cookie.getValue();
            }
        }
    %>
	<header>
		<nav class="container">
			<div class="logo">
				<img src="<%= contextPath%>/images/home images/logo.png"
					alt="Company Logo">
			</div>
			<ul class="navigation">
				<li><a href="<%= contextPath%>/products">Home</a></li>
				<li><a href="<%= contextPath%>/SendMessageServlet">About Us</a></li>
				<li><a href="<%= contextPath%>/ProfileServlet">Profile</a></li>
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
	
    <h1>Shopping Cart</h1>
    
    <table>
        <tr>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <c:forEach var="cartItem" items="${cartItems}">
            <tr>
                <td>${cartItem.productName}</td>
                <td>${cartItem.quantity}</td>
                <td>${cartItem.unitPrice}</td>
                <td><a href="<%=request.getContextPath()%>/CartServlet?action=delete&cartNo=${cartItem.cartNo}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    
    <form action="<%=request.getContextPath()%>/CheckoutServlet" method="post">
    <!-- Add a hidden input field to include the userId -->
    <input type="hidden" name="userId" value="${userId}">
    <input type="submit" value="Checkout">
</form>
</body>
</html>
