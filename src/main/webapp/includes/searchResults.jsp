<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String contextPath=request.getContextPath(); %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <!-- Add any necessary CSS or JavaScript here -->
    <link rel="stylesheet" href="<%= contextPath%>/stylesheets/index.css">
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
				<li><a href="#">About Us</a></li>
				<li><a href="#">Contact</a></li>
				<li><a href="<%= contextPath%>/Pages/login.jsp">Login</a></li>
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
    <h1>Search Results</h1>
    <div>
        <c:if test="${not empty searchResults}">
            <c:forEach var="product" items="${searchResults}">
                <div>
                    <h2>${product.productName}</h2>
                    <h2>${product.productDescription}</h2>
                    <a href="${pageContext.request.contextPath}/ProductDetailServlet?productId=${product.productId}"
                       class="btn">View Details</a>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty searchResults}">
            <p>No results found.</p>
        </c:if>
    </div>
</body>
</html>
