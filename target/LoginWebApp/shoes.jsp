<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Sneakers</title>
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
        }
        .product-preview {
            border: 1px solid #ddd;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
            background-color: #f9f9f9;
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
            min-height: 100px;
        }
        .discount-info {
            background-color: #e8f5e9;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
            border-left: 4px solid #4CAF50;
        }
        .discount-info h3 {
            margin-top: 0;
            color: #2e7d32;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        button:hover {
            background-color: #45a049;
        }
        .link-section {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Order Your Sneakers</h2>

    <div class="product-preview">
        <h3>Nike Zoom Vomero Roam</h3>
        <p>Choose your quantity below to see your total with automatic discounts!</p>
    </div>

    <form action="shoeResult.jsp" method="post">
        <input type="hidden" id="productName" name="productName" value="Nike Zoom Vomero Roam">
        <input type="hidden" id="imageUrl" name="imageUrl" value="https://static.nike.com/a/images/t_web_pdp_535_v2/f_auto/421f5475-0c06-4c9e-b577-950eb5c82f0c/W+NIKE+ZOOM+VOMERO+ROAM.png">
        <input type="hidden" id="description" name="description" value="Designed for city conditions, this winterized version of the Vomero is made for wet weather. Durable materials and a rubber mudguard work together to help safeguard your shoes from dirt and puddles. Plus, a chunky midsole gives you a visible boost of comfort and style wherever you wander. Shown: Midnight Navy/World Indigo/Racer Blue/Black">
        <input type="hidden" id="unitPrice" name="unitPrice" value="180.00">

        <div style="text-align: center; margin: 30px 0;">
            <img src="https://static.nike.com/a/images/t_web_pdp_535_v2/f_auto/421f5475-0c06-4c9e-b577-950eb5c82f0c/W+NIKE+ZOOM+VOMERO+ROAM.png"
                 alt="Nike Zoom Vomero Roam"
                 style="max-width: 400px; width: 100%; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
        </div>

        <div style="text-align: center; margin: 20px 0;">
            <h3 style="margin: 10px 0; color: #333;">Nike Zoom Vomero Roam</h3>
            <p style="color: #666; line-height: 1.6; margin: 15px 0;">
                Designed for city conditions, this winterized version of the Vomero is made for wet weather.
                Durable materials and a rubber mudguard work together to help safeguard your shoes from dirt and puddles.
                Plus, a chunky midsole gives you a visible boost of comfort and style wherever you wander.
            </p>
            <p style="color: #888; font-size: 14px; font-style: italic; margin: 10px 0;">
                Shown: Midnight Navy/World Indigo/Racer Blue/Black
            </p>
            <p style="font-size: 28px; color: #4CAF50; font-weight: bold; margin: 20px 0;">$180.00</p>
        </div>

        <div class="form-group">
            <label for="quantity">How Many Pairs:</label>
            <input type="number" id="quantity" name="quantity"
                   min="1" value="1" required style="font-size: 18px; padding: 15px;">
        </div>

        <div class="discount-info">
            <h3>Save More When You Buy More!</h3>
            <ul>
                <li>Buy 5-9 pairs: Get <strong>5% OFF</strong></li>
                <li>Buy 10+ pairs: Get <strong>10% OFF</strong></li>
            </ul>
        </div>

        <button type="submit">Calculate My Total</button>
    </form>

    <div class="link-section">
        <p><a href="index.jsp">← Back to Home Page</a></p>
    </div>
</div>

</body>
</html>