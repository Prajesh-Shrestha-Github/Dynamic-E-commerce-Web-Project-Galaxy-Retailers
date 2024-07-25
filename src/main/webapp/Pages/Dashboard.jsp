<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,  initial-scale=1.0">
<title>Dashboard Page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheet/Dashboard.css">
</head>

<body>
	
		<!-- for header part -->
		<header>
			<div class="header-background"></div>
			<img src="<%=request.getContextPath()%>/images/home images/logo.png" alt="Galaxy Retailer Logo"
				class="header-logo">
		</header>

		<div class="main-container">

			<div class="navcontainer">

				<nav class="nav">
					<div class="nav-up">
						<div class="active nav-option" href="<%= request.getContextPath()%>/Dashboard" method="post">

							<h3>Dashboard</h3>
						</div>

						<div class="nav-option">

							<a class="inactive" href="<%= request.getContextPath()%>/AddProductServlet" method="get">
								<h3> Product</h3>
							</a>
						</div>

						<div class="nav-option">

							<a class="inactive" href="<%= request.getContextPath()%>/OrderServlet" method="get">
								<h3>Orders</h3>
							</a>
						</div>
					</div>
				</nav>
			</div>

			<section id="product1" class="section-p1">
				<div class="heading">
					<marquee>
						<b> Welcome to the dashboard, Admin.</b>
					</marquee>
				</div>
				<div class="profile">
					
					<div class="dropdown">
						<button class="dropbtn">Admin Profile</button>
						<div class="dropdown-content">
							
							<a href="<%=request.getContextPath()%>/AdminLogoutServlet">Logout</a>
						</div>
					</div>
				</div>


				<div class="pro-container">
					<div class="pro">

						<div class="des">

							<h2>Total Products </h2>
							<h1><%= request.getAttribute("totalProducts") %></h1>
						</div>

					</div>
					
				</div>
			</section>
	</div>
</body>
</html>