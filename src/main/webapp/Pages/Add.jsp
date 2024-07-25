<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheet/Add.css">
</head>
<body>
<div class="form">
	<form action="<%= request.getContextPath() %>/AddProductServlet" method="post" enctype="multipart/form-data">

		<div class="row">
			<div class="col">
			
		
			<label for="image">Image:</label>
    <input type="file" id="image" name="image" required alt="product image">
    
			
				<label for="productID">Product ID:</label> <input type="text"
					id="productID" name="productID" required>
			</div>

			<div class="col">
				<label for="productName">Product Name:</label> <input type="text"
					id="productName" name="productname" required>
			</div>

		</div>

		<div class="row">
			<div class="col">
				<label for="price">Product Price:</label> <input type="text"
					id="price" name="price" required>
			</div>
		</div>

		
		<div class="row">
			<div class="col">
				<label for="description">Description:</label> <input type="text" id="description"
					name="description" required>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<label for="stock">Stock:</label> <input type="text" id="stock"
					name="stock" required>
			</div>
		</div>
		
		
		<button class="add-button" type="submit">Add New Product</button>
	</form>
	</div>
</body>
</html>