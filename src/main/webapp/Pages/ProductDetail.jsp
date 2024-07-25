<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="utils.StringUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% HttpSession emailsession = request.getSession(); 
 String currentUser = (String) emailsession.getAttribute("username");
 String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<%=contextPath%>/stylesheets/ProductDetail.css">
<title>Product Page</title>


</head>
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

<body>

	<div class="container">
		<div class="product-info">
			<div class="left-section">
				<img
					src="<%= contextPath%>/images/home images/${product.productName}.png"
					alt="${product.productName}" class="product-image">

			</div>
			<div class="right-section">
				<div class="product-header">
					<h1>${product.productName}</h1>
				</div>

				<div class="stockprice">
					<h3>Instock: ${product.stockLevel}</h3>
					<h3>Price: $${product.unitPrice}</h3>
				</div>

				<div class="description">
					<h2>Description</h2>
					<p>${product.productDescription}</p>
				</div>

				<div class="buttons">
					<!-- You can add functionality to these buttons as needed -->
					<form action="<%= request.getContextPath() %>/addToCart"
				method="post">
				<input type="hidden" name="productId" value="${product.productId}">
				<input type="number" name="quantity" value="1" min="1">
				<button type="submit">Add to Cart</button>
			</form>

				</div>

			</div>
		</div>
	</div>
	<hr>

	<footer class="section-p1">
		<div class="col">
			<img src="../images/home images/logo.png" alt="">
			<h4>Contact</h4>
			<P>
				<Strong>Address: </Strong> 562 Baneshwor, Kathmandu 07, Nepal
			</P>
			<p>
				<Strong>Hours:</Strong> 10:00 - 18:00, Sun - Fri
			</p>
			<div class="icon">
				<i class="fab fa-facebook-f"></i> <i class="fab fa-instagram"></i> <i
					class="fab fa-twitter"></i> <i class="fab fa-pinterest"></i> <i
					class="fab fa-youtube"></i>
			</div>
		</div>


		<div class="col">
			<h4>About</h4>
			<a href="#">About us</a> <a href="#">Delivery Information</a> <a
				href="#">Privacy Policy</a> <a href="#">Terms and Condition</a> <a
				href="#">Contact Us</a>
		</div>


		<div class="col">
			<h4>My Account</h4>
			<a href="#">Sign In</a> <a href="#">View Cart</a> <a href="#">My
				Wishlist</a> <a href="#">Track My Order</a> <a href="#">Help</a>
		</div>

	</footer>

</body>
</html>
