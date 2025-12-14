<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Product" %>
<%@ page import="java.util.List" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 1200px;
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
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary {
            background-color: #4CAF50;
            color: white;
        }
        .btn-primary:hover {
            background-color: #45a049;
        }
        .btn-edit {
            background-color: #2196F3;
            color: white;
        }
        .btn-edit:hover {
            background-color: #0b7dda;
        }
        .btn-delete {
            background-color: #f44336;
            color: white;
        }
        .btn-delete:hover {
            background-color: #da190b;
        }
        .btn-secondary {
            background-color: #757575;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #616161;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            background-color: #f9f9f9;
        }
        .product-image {
            width: 100%;
            height: 200px;
            object-fit: contain;
            border-radius: 8px;
            background-color: white;
            margin-bottom: 10px;
        }
        .product-name {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
        }
        .product-info {
            color: #666;
            font-size: 14px;
            margin-bottom: 5px;
        }
        .product-price {
            font-size: 20px;
            color: #4CAF50;
            font-weight: bold;
            margin: 10px 0;
        }
        .product-actions {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        .empty-message {
            text-align: center;
            padding: 40px;
            color: #666;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header-actions">
        <h2>Product Management</h2>
        <div>
            <a href="product?action=create" class="btn btn-primary">+ Add New Product</a>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>

    <% if (products != null && !products.isEmpty()) { %>
    <div class="product-grid">
        <% for (Product product : products) { %>
        <div class="product-card">
            <img src="<%= product.getProductImageUrl() %>"
                 alt="<%= product.getProductName() %>"
                 class="product-image">

            <div class="product-name"><%= product.getProductName() %></div>

            <div class="product-info">
                <strong>ID:</strong> <%= product.getProductId() %>
            </div>

            <div class="product-info">
                <%= product.getProductDescription() %>
            </div>

            <div class="product-info">
                <strong>Color:</strong> <%= product.getProductColor() %> |
                <strong>Size:</strong> <%= product.getProductSize() %>
            </div>

            <div class="product-price">$<%= String.format("%.2f", product.getProductPrice()) %></div>

            <div class="product-actions">
                <a href="product?action=edit&id=<%= product.getProductId() %>"
                   class="btn btn-edit">Edit</a>
                <a href="product?action=delete&id=<%= product.getProductId() %>"
                   class="btn btn-delete">Delete</a>
            </div>
        </div>
        <% } %>
    </div>
    <% } else { %>
    <div class="empty-message">
        <p>No products found. Click "Add New Product" to get started!</p>
    </div>
    <% } %>
</div>

</body>
</html>