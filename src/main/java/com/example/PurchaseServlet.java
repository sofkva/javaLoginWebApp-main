package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/purchase")
public class PurchaseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get product information
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDescription");
        String productColor = request.getParameter("productColor");
        String productSize = request.getParameter("productSize");
        String productPriceStr = request.getParameter("productPrice");
        String productImageUrl = request.getParameter("productImageUrl");
        String quantityStr = request.getParameter("quantity");

        // Parse numeric values
        double unitPrice = Double.parseDouble(productPriceStr);
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

        // Set attributes for JSP
        request.setAttribute("productId", productId);
        request.setAttribute("productName", productName);
        request.setAttribute("productDescription", productDescription);
        request.setAttribute("productColor", productColor);
        request.setAttribute("productSize", productSize);
        request.setAttribute("productImageUrl", productImageUrl);
        request.setAttribute("unitPrice", unitPrice);
        request.setAttribute("quantity", quantity);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("discountPercent", discountPercent);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("total", total);

        // Forward to purchase summary page
        request.getRequestDispatcher("purchase_summary.jsp").forward(request, response);
    }
}