<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Product" %>
<%@ page import="entity.ProductDAO" %>
<%@ page import="java.util.List" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAll();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Browse Shoes</title>
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
        .btn-secondary {
            background-color: #757575;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #616161;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 25px;
            margin-top: 20px;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: #f9f9f9;
            transition: transform 0.2s;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        .product-image {
            width: 100%;
            height: 250px;
            object-fit: contain;
            border-radius: 8px;
            background-color: white;
            margin-bottom: 15px;
        }
        .product-name {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .product-description {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
            line-height: 1.5;
        }
        .product-details {
            color: #555;
            font-size: 14px;
            margin: 8px 0;
        }
        .product-price {
            font-size: 24px;
            color: #4CAF50;
            font-weight: bold;
            margin: 15px 0;
        }
        .quantity-section {
            margin: 15px 0;
        }
        .quantity-section label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .quantity-section input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        .btn-buy {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .btn-buy:hover {
            background-color: #45a049;
        }
        .discount-info {
            background-color: #e8f5e9;
            padding: 10px;
            border-radius: 4px;
            margin-top: 15px;
            font-size: 12px;
            color: #2e7d32;
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
        <h2>Browse Available Shoes</h2>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>

    <% if (products != null && !products.isEmpty()) { %>
    <div class="product-grid">
        <% for (Product product : products) { %>
        <div class="product-card">
            <img src="<%= product.getProductImageUrl() %>"
                 alt="<%= product.getProductName() %>"
                 class="product-image">

            <div class="product-name"><%= product.getProductName() %></div>

            <div class="product-description">
                <%= product.getProductDescription() %>
            </div>

            <div class="product-details">
                <strong>Color:</strong> <%= product.getProductColor() %>
            </div>

            <div class="product-details">
                <strong>Size:</strong> <%= product.getProductSize() %>
            </div>

            <div class="product-price">$<%= String.format("%.2f", product.getProductPrice()) %></div>

            <form action="purchase" method="post">
                <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                <input type="hidden" name="productName" value="<%= product.getProductName() %>">
                <input type="hidden" name="productDescription" value="<%= product.getProductDescription() %>">
                <input type="hidden" name="productColor" value="<%= product.getProductColor() %>">
                <input type="hidden" name="productSize" value="<%= product.getProductSize() %>">
                <input type="hidden" name="productPrice" value="<%= product.getProductPrice() %>">
                <input type="hidden" name="productImageUrl" value="<%= product.getProductImageUrl() %>">

                <div class="quantity-section">
                    <label for="quantity_<%= product.getProductId() %>">Quantity (pairs):</label>
                    <input type="number" id="quantity_<%= product.getProductId() %>"
                           name="quantity" min="1" value="1" required>
                </div>

                <button type="submit" class="btn-buy">Buy Now</button>

                <div class="discount-info">
                    Buy 5-9 pairs: <strong>5% OFF</strong><br>
                    Buy 10+ pairs: <strong>10% OFF</strong>
                </div>
            </form>
        </div>
        <% } %>
    </div>
    <% } else { %>
    <div class="empty-message">
        <p>No products available at the moment. Please check back later!</p>
    </div>
    <% } %>
</div>

</body>
</html>