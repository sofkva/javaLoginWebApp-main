package com.example;

import entity.Product;
import entity.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "list":
            default:
                listProducts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action) {
            case "insert":
                insertProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = productDAO.getAll();
        request.setAttribute("products", products);
        request.getRequestDispatcher("product_read.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("product_create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Optional<Product> product = productDAO.get(id);

        if (product.isPresent()) {
            request.setAttribute("product", product.get());
            request.getRequestDispatcher("product_update.jsp").forward(request, response);
        } else {
            response.sendRedirect("product?action=list");
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Optional<Product> product = productDAO.get(id);

        if (product.isPresent()) {
            request.setAttribute("product", product.get());
            request.getRequestDispatcher("product_delete.jsp").forward(request, response);
        } else {
            response.sendRedirect("product?action=list");
        }
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String name = request.getParameter("productName");
        String description = request.getParameter("productDescription");
        String color = request.getParameter("productColor");
        String size = request.getParameter("productSize");
        double price = Double.parseDouble(request.getParameter("productPrice"));
        String imageUrl = request.getParameter("productImageUrl");

        Product product = new Product(name, description, color, size, price, imageUrl);
        productDAO.insert(product);

        response.sendRedirect("product_read.jsp");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("productName");
        String description = request.getParameter("productDescription");
        String color = request.getParameter("productColor");
        String size = request.getParameter("productSize");
        double price = Double.parseDouble(request.getParameter("productPrice"));
        String imageUrl = request.getParameter("productImageUrl");

        Product product = new Product(id, name, description, color, size, price, imageUrl);
        productDAO.update(product);

        response.sendRedirect("product_read.jsp");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("productId"));
        Optional<Product> product = productDAO.get(id);

        if (product.isPresent()) {
            productDAO.delete(product.get());
        }

        response.sendRedirect("product_read.jsp");
    }
}