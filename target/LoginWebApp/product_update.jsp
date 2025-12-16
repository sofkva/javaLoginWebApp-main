<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Product" %>
<%@ page import="entity.ProductDAO" %>
<%@ page import="java.util.Optional" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    // Get product ID from URL parameter
    int productId = Integer.parseInt(request.getParameter("id"));
    ProductDAO productDAO = new ProductDAO();
    Optional<Product> productOpt = productDAO.get(productId);

    if (!productOpt.isPresent()) {
        response.sendRedirect("product_read.jsp");
        return;
    }
    Product product = productOpt.get();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            border-bottom: 2px solid #2196F3;
            padding-bottom: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        textarea {
            resize: vertical;
            min-height: 80px;
        }
        .product-preview {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
        }
        .product-preview img {
            max-width: 300px;
            border-radius: 8px;
            margin-bottom: 10px;
        }
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn-primary {
            background-color: #2196F3;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0b7dda;
        }
        .btn-secondary {
            background-color: #757575;
            color: white;
            text-decoration: none;
            display: inline-block;
        }
        .btn-secondary:hover {
            background-color: #616161;
        }
        .actions {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Product</h2>

    <div class="product-preview">
        <img src="<%= product.getProductImageUrl() %>" alt="<%= product.getProductName() %>">
        <p><strong>Product ID:</strong> <%= product.getProductId() %></p>
    </div>

    <form action="product" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="productId" value="<%= product.getProductId() %>">

        <div class="form-group">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName"
                   value="<%= product.getProductName() %>" required>
        </div>

        <div class="form-group">
            <label for="productDescription">Description:</label>
            <textarea id="productDescription" name="productDescription" required><%= product.getProductDescription() %></textarea>
        </div>

        <div class="form-group">
            <label for="productColor">Color:</label>
            <input type="text" id="productColor" name="productColor"
                   value="<%= product.getProductColor() %>" required>
        </div>

        <div class="form-group">
            <label for="productSize">Size:</label>
            <input type="text" id="productSize" name="productSize"
                   value="<%= product.getProductSize() %>" required>
        </div>

        <div class="form-group">
            <label for="productPrice">Price ($):</label>
            <input type="number" id="productPrice" name="productPrice"
                   value="<%= product.getProductPrice() %>"
                   step="0.01" min="0" required>
        </div>

        <div class="form-group">
            <label for="productImageUrl">Image URL:</label>
            <input type="text" id="productImageUrl" name="productImageUrl"
                   value="<%= product.getProductImageUrl() %>" required>
        </div>

        <div class="actions">
            <button type="submit" class="btn btn-primary">Update Product</button>
            <a href="product_read.jsp" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>