<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.List" %>
<%@ page import="model.OrderModel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Galaxy Retailer Dashboard</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheet/Order.css">
</head>
<body>
	<header>
		<div class="header-background"></div>
		<img src="<%=request.getContextPath()%>/images/home images/logo.png" alt="Galaxy Retailer Logo"
			class="header-logo">
	</header>

	<div class="main-container">
		<div class="navcontainer">
			<nav class="nav">
				<div class="nav-up">
					<div class="nav-option">

						<a class="inactive"
							href="<%=request.getContextPath()%>/Dashboard">
							<h3> Dashboard </h3>
						</a>
					</div>

					<div class="nav-option">

						<a class="inactive" href="<%= request.getContextPath()%>/AddProductServlet" method="get">
								<h3>Product</h3>
						</a>
					</div>

					<div class=" active nav-option">

						<h3>Orders</h3>
					</div>
				</div>
			</nav>
		</div>
		<main>
			<h2>Orders</h2>
			<table>
				<thead>
					<tr>
						<th>Order ID</th>
						<th>User ID</th>
						<th>Order Date</th>
						<th>Order Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				 <c:forEach var="order" items="${orders}">
					<tr>
						<td>${order.orderNo}</td>
						<td>${order.userNo}</td>
						<td>${order.orderDate}</td>
						<td>${order.orderStatus}</td>
						
						 <td>
						 <a href="${pageContext.request.contextPath}/Pages/UpdateOrderStatus.jsp?orderId=${order.orderNo}">Update Order Status</a>
						
						</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</main>
	</div>
</body>
</html>
