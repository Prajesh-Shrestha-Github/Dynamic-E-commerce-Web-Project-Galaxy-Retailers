<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<% String contextPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/stylesheet/About.css">
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

	<h1>About Us</h1>
	<section class="s3">
		<div class="image">
			<img src="<%= contextPath%>/images/home images/cart.png"
						alt="Cart Icon">
		</div>

		<div class="about">
			<p>Welcome to Galaxy Retailers. A go-to destination for the latest Samsung smartphones, We provide services with a passion for technology and a dedication to customer satisfaction. We offer a curated selection of cutting-edge devices. Let us help you stay connected and empowered in today's digital world.</p>
		</div>
	</section>
	<section class="group">
		<h1>Team Members</h1>
		<div id="members">
			<img src="<%= contextPath%>/images/home images/prajesh.jpg" alt="Prajesh">
			<h2>
				<a href="prajesh.html">Prajesh</a>
			</h2>
		</div>

		<div id="members">
			<img src="<%= contextPath%>/images/home images/rhishab.jpg" alt="Rhishab">
			<h2>
				<a href="Rishab.html">Rhishab</a>
			</h2>
		</div>

		<div id="members">
			<img src="<%= contextPath%>/images/home images/asmi.jpg" alt="Asmi">
			<h2>
				<a href="asmi.html">Asmi</a>
			</h2>
		</div>

		<div id="members">
			<img src="<%= contextPath%>/images/home%20images/sarthak.jpg" alt="Sarthak">
			<h2>
				<a href="Sarthak.html">Sarthak</a>
			</h2>
		</div>

		<div id="members">
			<img src="<%= contextPath%>/images/home images/sara.jpg" alt="Sara">
			<h2>
				<a href="sara.html">Sara</a>
			</h2>
		</div>
	</section>
	<footer class="section-p2">
		<div class="col">
			<img src="<%= contextPath%>/images/home images/logo.png" alt="" class="footlogo">
		</div>

		<div class="contact">
			<h4>Contact Us</h4>
			<p>
				<strong>Address:</strong> Durbarmarg, Kathmandu
			</p>
			<p>
				<strong>Phone:</strong> +977 9800000001
			</p>
			<p>
				<strong>Email:</strong> galaxyretailers@gmail.com
			</p>
		</div>

		<form action="../SendMessageServlet" method="post">
			<p>
				<label for="w3review">Review/Message:</label>
			</p>
			<textarea id="message" name="message" rows="4" cols="50"></textarea>
			<br> <input type="submit" value="Submit">
		</form>
	</footer>
	<div class="copyright">
		<p>Copyright © [2024] , Galaxy Retailers All rights reserved.</p>
	</div>
</body>
</html>
