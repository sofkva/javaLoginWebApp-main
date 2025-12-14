<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String productName = (String) request.getAttribute("productName");
    String productDescription = (String) request.getAttribute("productDescription");
    String productColor = (String) request.getAttribute("productColor");
    String productSize = (String) request.getAttribute("productSize");
    String productImageUrl = (String) request.getAttribute("productImageUrl");
    double unitPrice = (Double) request.getAttribute("unitPrice");
    int quantity = (Integer) request.getAttribute("quantity");
    double subtotal = (Double) request.getAttribute("subtotal");
    double discountPercent = (Double) request.getAttribute("discountPercent");
    double discountAmount = (Double) request.getAttribute("discountAmount");
    double total = (Double) request.getAttribute("total");

    boolean hasDiscount = (discountPercent > 0);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
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
            margin-top: 0;
        }
        .success-message {
            background-color: #c8e6c9;
            color: #2e7d32;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #4CAF50;
        }
        .product-display {
            display: flex;
            gap: 25px;
            margin: 25px 0;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
        .product-image {
            flex: 0 0 280px;
        }
        .product-image img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            background-color: white;
            padding: 10px;
        }
        .product-details {
            flex: 1;
        }
        .product-name {
            font-size: 26px;
            font-weight: bold;
            color: #333;
            margin-bottom: 12px;
        }
        .product-description {
            color: #666;
            line-height: 1.6;
            margin-bottom: 15px;
        }
        .product-spec {
            color: #555;
            margin: 8px 0;
            font-size: 15px;
        }
        .price-info {
            font-size: 20px;
            color: #4CAF50;
            font-weight: bold;
            margin-top: 15px;
        }
        .order-summary {
            background-color: #e8f5e9;
            padding: 25px;
            border-radius: 8px;
            margin: 25px 0;
        }
        .order-summary h3 {
            margin-top: 0;
            color: #2e7d32;
            font-size: 22px;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #c8e6c9;
            font-size: 16px;
        }
        .summary-row:last-child {
            border-bottom: none;
        }
        .summary-label {
            color: #555;
        }
        .summary-value {
            font-weight: bold;
            color: #333;
        }
        .discount-row {
            color: #d32f2f;
        }
        .discount-badge {
            display: inline-block;
            background-color: #d32f2f;
            color: white;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 13px;
            margin-left: 10px;
        }
        .total-row {
            font-size: 22px;
            padding-top: 15px;
            margin-top: 15px;
            border-top: 2px solid #4CAF50;
        }
        .total-row .summary-value {
            color: #2e7d32;
            font-size: 28px;
        }
        .tip-box {
            background-color: #fff3cd;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            border-left: 4px solid #ffc107;
        }
        .actions {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            display: flex;
            gap: 15px;
        }
        .btn {
            padding: 14px 35px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        .btn-primary {
            background-color: #4CAF50;
            color: white;
        }
        .btn-primary:hover {
            background-color: #45a049;
        }
        .btn-secondary {
            background-color: #757575;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #616161;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="success-message">
        Your order looks good!
    </div>

    <h2>Order Summary</h2>

    <div class="product-display">
        <div class="product-image">
            <img src="<%= productImageUrl %>" alt="<%= productName %>">
        </div>
        <div class="product-details">
            <div class="product-name"><%= productName %></div>
            <div class="product-description"><%= productDescription %></div>
            <div class="product-spec"><strong>Color:</strong> <%= productColor %></div>
            <div class="product-spec"><strong>Size:</strong> <%= productSize %></div>
            <div class="price-info">$<%= String.format("%.2f", unitPrice) %> each</div>
        </div>
    </div>

    <div class="order-summary">
        <h3>Your Order</h3>

        <div class="summary-row">
            <span class="summary-label">Quantity:</span>
            <span class="summary-value"><%= quantity %> pairs</span>
        </div>

        <div class="summary-row">
            <span class="summary-label">Price Each:</span>
            <span class="summary-value">$<%= String.format("%.2f", unitPrice) %></span>
        </div>

        <div class="summary-row">
            <span class="summary-label">Subtotal:</span>
            <span class="summary-value">$<%= String.format("%.2f", subtotal) %></span>
        </div>

        <% if (hasDiscount) { %>
        <div class="summary-row discount-row">
            <span class="summary-label">
                You Save:
                <span class="discount-badge"><%= String.format("%.0f", discountPercent) %>% OFF</span>
            </span>
            <span class="summary-value">-$<%= String.format("%.2f", discountAmount) %></span>
        </div>
        <% } else { %>
        <div class="summary-row">
            <span class="summary-label">You Save:</span>
            <span class="summary-value">$0.00</span>
        </div>
        <% } %>

        <div class="summary-row total-row">
            <span class="summary-label">Total Price:</span>
            <span class="summary-value">$<%= String.format("%.2f", total) %></span>
        </div>
    </div>

    <% if (!hasDiscount) { %>
    <div class="tip-box">
        <strong>Tip:</strong> Buy 5+ pairs for 5% OFF or 10+ pairs for 10% OFF!
    </div>
    <% } %>

    <div class="actions">
        <a href="browse_shoes.jsp" class="btn btn-primary">Continue Shopping</a>
        <a href="index.jsp" class="btn btn-secondary">Go Home</a>
    </div>
</div>

</body>
</html>