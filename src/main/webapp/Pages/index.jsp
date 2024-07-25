<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.Product"%>
<%@ page import="java.util.List"%>
<%@ page import="utils.StringUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% HttpSession emailsession = request.getSession(); 
 String currentUser = (String) emailsession.getAttribute("username");
 String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ecommerce Website</title>
<link rel="stylesheet" href="<%= contextPath%>/stylesheets/index.css">
</head>


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




	<section class="image-section">
		
		<img src="<%= contextPath%>/images/home images/hero.jpg"
			alt="Hero Image">
	</section>

	<section class="image-section2">
		<img src="<%= contextPath%>/images/home images/banner.jpg"
			alt="Banner Image">
	</section>
	<div class="Featured product"
		style="font: bold; margin-top: 5px; background-color: #ffffff; padding: 70px; text-align: center; width: 100%; font-size: 1.27em;">
		<h2>Featured Products</h2>

	</div>

	<section class="Product">
	<c:forEach var="product" items="${products}">
	
		<div class="flex-box">
			<img
				src="<%= contextPath%>/images/home images/${product.productName}.png"
				alt="${product.productName}">
			<h3>${product.productName}</h3>
			<a href="${pageContext.request.contextPath}/ProductDetailServlet?productId=${product.productId}"
                       class="btn">View Details</a>
			<form action="<%= request.getContextPath() %>/addToCart"
				method="post">
				<input type="hidden" name="productId" value="${product.productId}">
				<input type="number" name="quantity" value="1" min="1">
				<button type="submit">Add to Cart</button>
			</form>
		</div>

	</c:forEach>
	</section>






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