<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,  initial-scale=1.0">
<title>Product Page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheet/Product.css">
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
					<div class="nav-option">
						<a class="inactive"
							href="<%=request.getContextPath()%>/Dashboard">
							<h3> Dashboard </h3>
						</a>
					</div>

					<div class="active nav-option">

						<h3>Product</h3>

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
			<div class="pro-container">
			<c:forEach var="product" items="${listOfProduct}">
			<div class="pro">
				
					<form action="${pageContext.request.contextPath}/AddProductServlet" method="post" enctype="multipart/form-data">
					<div class="des">
					
					<img src="images/home images/${product.imagePart}"
						class="card-img-top" alt="ProductImage">
						<span> <c:out value="${product.productID}"></c:out> </span>
						<h5><c:out value="${product.productName}"></c:out></h5>
						<h4><c:out value="${product.price}"></c:out> </h4>
						
					</div>
					</form>
					<div class="dropdown">

						<div class="dropdown-content">
							<form action="<%=request.getContextPath() %>/ProductUpdateServlet" method="get">
								<input type="hidden" name="id" value="${product.productID }" style="display: none;">
								<button class="update-button" type="submit">Update</button>
							</form>
							
							<form action="<%=request.getContextPath() %>/ProductDeletionServlet" method="post">
								<input type="hidden" name="id" value="${product.productID }" style="display: none;">
								<button>Delete</button>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
				
			 </div>
				<a href="<%=request.getContextPath()%>/Pages/Add.jsp">
					<button class="add-button" type="submit">Click to add new product</button>
				</a>
				
		</section>
	</div>

</body>
</html>