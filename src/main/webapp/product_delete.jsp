<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Product" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Product</title>
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
            color: #f44336;
            border-bottom: 2px solid #f44336;
            padding-bottom: 10px;
        }
        .warning-box {
            background-color: #fff3cd;
            border: 2px solid #ffc107;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
        }
        .warning-box h3 {
            color: #856404;
            margin-top: 0;
        }
        .warning-box p {
            color: #856404;
        }
        .product-details {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
            text-align: center;
        }
        .product-details img {
            max-width: 300px;
            border-radius: 8px;
            margin-bottom: 15px;
        }
        .product-info {
            text-align: left;
            margin-top: 15px;
            padding: 15px;
            background-color: white;
            border-radius: 4px;
        }
        .product-info p {
            margin: 8px 0;
            color: #333;
        }
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn-danger {
            background-color: #f44336;
            color: white;
        }
        .btn-danger:hover {
            background-color: #da190b;
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
    <h2>Delete Product</h2>

    <div class="warning-box">
        <h3>Warning</h3>
        <p>Are you sure you want to permanently delete this product? This action cannot be undone.</p>
    </div>

    <div class="product-details">
        <img src="<%= product.getProductImageUrl() %>" alt="<%= product.getProductName() %>">

        <div class="product-info">
            <p><strong>Product ID:</strong> <%= product.getProductId() %></p>
            <p><strong>Name:</strong> <%= product.getProductName() %></p>
            <p><strong>Description:</strong> <%= product.getProductDescription() %></p>
            <p><strong>Color:</strong> <%= product.getProductColor() %></p>
            <p><strong>Size:</strong> <%= product.getProductSize() %></p>
            <p><strong>Price:</strong> $<%= String.format("%.2f", product.getProductPrice()) %></p>
        </div>
    </div>

    <form action="product" method="post">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="productId" value="<%= product.getProductId() %>">

        <div class="actions">
            <button type="submit" class="btn btn-danger"
                    onclick="return confirm('Are you absolutely sure you want to delete this product?');">
                Yes, Delete Product
            </button>
            <a href="product?action=list" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>