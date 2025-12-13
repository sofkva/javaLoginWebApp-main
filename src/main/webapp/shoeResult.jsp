<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get form parameters
    String productName = request.getParameter("productName");
    String imageUrl = request.getParameter("imageUrl");
    String description = request.getParameter("description");
    String unitPriceStr = request.getParameter("unitPrice");
    String quantityStr = request.getParameter("quantity");

    // Parse numeric values
    double unitPrice = Double.parseDouble(unitPriceStr);
    int quantity = Integer.parseInt(quantityStr);

    // Calculate subtotal
    double subtotal = unitPrice * quantity;

    // Determine discount based on quantity
    double discountPercent = 0.0;
    if (quantity >= 10) {
        discountPercent = 10.0;
    } else if (quantity >= 5) {
        discountPercent = 5.0;
    }

    // Calculate discount amount and final total
    double discountAmount = subtotal * (discountPercent / 100.0);
    double total = subtotal - discountAmount;

    // Format values
    String formattedUnitPrice = String.format("%.2f", unitPrice);
    String formattedSubtotal = String.format("%.2f", subtotal);
    String formattedDiscountAmount = String.format("%.2f", discountAmount);
    String formattedTotal = String.format("%.2f", total);
    String formattedDiscountPercent = String.format("%.0f", discountPercent);

    boolean hasDiscount = (discountPercent > 0);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Order Summary</title>
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
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
            margin-top: 0;
        }
        .product-display {
            display: flex;
            gap: 20px;
            margin: 20px 0;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
        .product-image {
            flex: 0 0 250px;
        }
        .product-image img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
        .product-details {
            flex: 1;
        }
        .product-name {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .product-description {
            color: #666;
            line-height: 1.6;
            margin-bottom: 15px;
        }
        .price-info {
            font-size: 18px;
            color: #4CAF50;
            font-weight: bold;
        }
        .order-summary {
            background-color: #e8f5e9;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
        }
        .order-summary h3 {
            margin-top: 0;
            color: #2e7d32;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid #c8e6c9;
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
        .total-row {
            font-size: 20px;
            padding-top: 15px;
            margin-top: 10px;
            border-top: 2px solid #4CAF50;
        }
        .total-row .summary-value {
            color: #2e7d32;
            font-size: 24px;
        }
        .discount-badge {
            display: inline-block;
            background-color: #d32f2f;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
            margin-left: 10px;
        }
        .actions {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            display: flex;
            gap: 15px;
        }
        .btn {
            padding: 12px 30px;
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
        .success-message {
            background-color: #c8e6c9;
            color: #2e7d32;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #4CAF50;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="success-message">
        ✓ Your order looks good!
    </div>

    <h2>Order Summary</h2>

    <div class="product-display">
        <div class="product-image">
            <img src="<%= imageUrl %>" alt="<%= productName %>">
        </div>
        <div class="product-details">
            <div class="product-name"><%= productName %></div>
            <div class="product-description"><%= description %></div>
            <div class="price-info">$<%= formattedUnitPrice %> each</div>
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
            <span class="summary-value">$<%= formattedUnitPrice %></span>
        </div>

        <div class="summary-row">
            <span class="summary-label">Subtotal:</span>
            <span class="summary-value">$<%= formattedSubtotal %></span>
        </div>

        <% if (hasDiscount) { %>
        <div class="summary-row discount-row">
            <span class="summary-label">
                You Save:
                <span class="discount-badge"><%= formattedDiscountPercent %>% OFF</span>
            </span>
            <span class="summary-value">-$<%= formattedDiscountAmount %></span>
        </div>
        <% } else { %>
        <div class="summary-row">
            <span class="summary-label">You Save:</span>
            <span class="summary-value">$0.00</span>
        </div>
        <% } %>

        <div class="summary-row total-row">
            <span class="summary-label">Total Price:</span>
            <span class="summary-value">$<%= formattedTotal %></span>
        </div>
    </div>

    <% if (!hasDiscount) { %>
    <div style="background-color: #fff3cd; padding: 15px; border-radius: 4px; margin: 20px 0; border-left: 4px solid #ffc107;">
        <strong>💡 Tip:</strong> Buy 5+ pairs for 5% OFF or 10+ pairs for 10% OFF!
    </div>
    <% } %>

    <div class="actions">
        <a href="shoes.jsp" class="btn btn-primary">Order Again</a>
        <a href="index.jsp" class="btn btn-secondary">Go Home</a>
    </div>
</div>

</body>
</html>