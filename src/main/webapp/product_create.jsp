<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Product</title>
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
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
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
    <h2>Add New Product</h2>

    <form action="product" method="post">
        <input type="hidden" name="action" value="insert">

        <div class="form-group">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" required>
        </div>

        <div class="form-group">
            <label for="productDescription">Description:</label>
            <textarea id="productDescription" name="productDescription" required></textarea>
        </div>

        <div class="form-group">
            <label for="productColor">Color:</label>
            <input type="text" id="productColor" name="productColor" required>
        </div>

        <div class="form-group">
            <label for="productSize">Size:</label>
            <input type="text" id="productSize" name="productSize" required>
        </div>

        <div class="form-group">
            <label for="productPrice">Price ($):</label>
            <input type="number" id="productPrice" name="productPrice"
                   step="0.01" min="0" required>
        </div>

        <div class="form-group">
            <label for="productImageUrl">Image URL:</label>
            <input type="text" id="productImageUrl" name="productImageUrl" required>
        </div>

        <div class="actions">
            <button type="submit" class="btn btn-primary">Add Product</button>
            <a href="product?action=list" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>