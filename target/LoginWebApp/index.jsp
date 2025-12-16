<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Shoe Store Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
            min-height: 100vh;
        }
        .container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
        }
        .header h1 {
            color: #333;
            margin: 0 0 10px 0;
            font-size: 32px;
        }
        .header p {
            color: #666;
            font-size: 18px;
        }
        .welcome-box {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            border-radius: 4px;
            margin-bottom: 30px;
            text-align: center;
        }
        .welcome-box h2 {
            margin: 0;
            font-size: 22px;
        }
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        .menu-card {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 25px 20px;
            text-align: center;
            transition: all 0.2s;
        }
        .menu-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-color: #4CAF50;
        }
        .menu-card-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
        .menu-card h3 {
            color: #333;
            margin: 10px 0;
            font-size: 20px;
        }
        .menu-card p {
            color: #666;
            font-size: 14px;
            margin: 10px 0 20px 0;
        }
        .menu-card a {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 25px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: normal;
            transition: background-color 0.2s;
        }
        .menu-card a:hover {
            background-color: #45a049;
        }
        .logout-section {
            text-align: center;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid #ddd;
        }
        .logout-section a {
            color: #d32f2f;
            text-decoration: none;
            font-size: 14px;
        }
        .logout-section a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Shoe Store Management System</h1>
        <p>Your complete shoe inventory and sales solution</p>
    </div>

    <div class="welcome-box">
        <h2>Welcome, <%= username %>!</h2>
    </div>

    <div class="menu-grid">
        <div class="menu-card">
            <h3>Browse Shoes</h3>
            <p>View available shoes and make purchases with automatic discounts</p>
            <a href="browse_shoes.jsp">Start Shopping</a>
        </div>

        <div class="menu-card">
            <h3>Manage Products</h3>
            <p>Add, edit, view, or delete shoe products from inventory</p>
            <a href="product_read.jsp">Manage Inventory</a>
        </div>
    </div>

    <div class="logout-section">
        <a href="logout">Logout</a>
    </div>
</div>

</body>
</html>