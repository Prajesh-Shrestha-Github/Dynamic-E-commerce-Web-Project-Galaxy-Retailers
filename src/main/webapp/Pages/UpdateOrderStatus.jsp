<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Update Order Status</title>

<link rel="stylesheet"

	href="<%=request.getContextPath()%>/stylesheet/UpdateOrderStatus.css">

</head>

<body>



	<!-- for header part -->

	<header>

		<div class="header-background"></div>

		<img src="<%=request.getContextPath()%>/images/logo.png"

			alt="Galaxy Retailer Logo" class="header-logo">

	</header>

	<div class="main-container">

		<div class="navcontainer">

			<nav class="nav">

				<div class="nav-up">

					<div class="nav-option">

						<a class="inactive" href="<%=request.getContextPath()%>/Dashboard">

							<h3>Dashboard</h3>

						</a>

					</div>



					<div class="nav-option">



						<a class="inactive"

							href="<%=request.getContextPath()%>/AddProductServlet"

							method="get">

							<h3>Product</h3>

						</a>

					</div>



					<div class=" active nav-option">



						<h3>Orders</h3>

					</div>

				</div>

			</nav>

		</div>



		<h1>Update Order Status</h1>



		<form

			action="${pageContext.request.contextPath}/UpdateOrderStatusServlet"

			method="post">



			<input type="hidden" name="orderId" value="${param.orderId}">

			<label for="orderStatus">Order Status:</label> <select

				name="orderStatus" id="orderStatus" class="lower-dropdown">

				<option value="pending">Pending</option>

				<option value="approved">Approved</option>

				<option value="shipped">Shipped</option>

				<option value="delivered">Delivered</option>

			</select>

			<button type="submit">Update</button>

		</form>

</body>

</html>  