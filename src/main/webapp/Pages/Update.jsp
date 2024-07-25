<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.ProductModel" %>
	<%-- scriptlet --%>
	<% ProductModel productInfo = (ProductModel)request.getAttribute("productInfo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheet/Update.css">
</head>
<body>
<div class="form">
	<form action="<%=request.getContextPath() %>/ProductUpdateServlet" method="post">

		<div class="row">
			<div class="col">
				<label for="productID">Product ID: </label> <input type="text" value="<%= productInfo.getProductID() %>"
					id="productID" name="id" required>
			</div>

			<div class="col">
				<label for="productName">Product Name:</label> <input type="text" value="<%= productInfo.getProductName() %>"
					id="productName" name="productName" required>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<label for="price">Product Price:</label> <input type="text" value="<%= productInfo.getPrice() %>"
					id="price" name="price" required>
			</div>
		</div>

		
		<div class="row">
			<div class="col">
				<label for="description">Description:</label> <input type="text" id="description" value="<%= productInfo.getProductDescription() %>"
					name="description" required>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<label for="stock">Stock:</label> <input type="text" id="stock" value="<%= productInfo.getStock() %>"
					name="stock" required>
			</div>
		</div>
		
		
		<button class="add-button" type="submit">Update</button>
	</form>
	</div>
</body>
</html>