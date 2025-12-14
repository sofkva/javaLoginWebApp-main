package entity;

import core.DB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductDAO implements DAO<Product> {

    @Override
    public Optional<Product> get(int id) {
        String sql = "SELECT * FROM HD_Product WHERE product_id = ?";
        try {
            PreparedStatement ps = DB.getInstance().getPreparedStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_description"),
                        rs.getString("product_color"),
                        rs.getString("product_size"),
                        rs.getDouble("product_price"),
                        rs.getString("product_image_url")
                );
                return Optional.of(product);
            }
        } catch (SQLException e) {
            System.err.println("Error getting product: " + e.getMessage());
        }
        return Optional.empty();
    }

    @Override
    public List<Product> getAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM HD_Product ORDER BY product_id";

        try {
            ResultSet rs = DB.getInstance().executeQuery(sql);
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_description"),
                        rs.getString("product_color"),
                        rs.getString("product_size"),
                        rs.getDouble("product_price"),
                        rs.getString("product_image_url")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            System.err.println("Error getting all products: " + e.getMessage());
        }
        return products;
    }

    @Override
    public void insert(Product product) {
        String sql = "INSERT INTO HD_Product (product_name, product_description, " +
                "product_color, product_size, product_price, product_image_url) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = DB.getInstance().getPreparedStatement(sql);
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getProductDescription());
            ps.setString(3, product.getProductColor());
            ps.setString(4, product.getProductSize());
            ps.setDouble(5, product.getProductPrice());
            ps.setString(6, product.getProductImageUrl());
            ps.executeUpdate();
            System.out.println("Product inserted successfully!");
        } catch (SQLException e) {
            System.err.println("Error inserting product: " + e.getMessage());
        }
    }

    @Override
    public void update(Product product) {
        String sql = "UPDATE HD_Product SET product_name = ?, product_description = ?, " +
                "product_color = ?, product_size = ?, product_price = ?, " +
                "product_image_url = ? WHERE product_id = ?";
        try {
            PreparedStatement ps = DB.getInstance().getPreparedStatement(sql);
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getProductDescription());
            ps.setString(3, product.getProductColor());
            ps.setString(4, product.getProductSize());
            ps.setDouble(5, product.getProductPrice());
            ps.setString(6, product.getProductImageUrl());
            ps.setInt(7, product.getProductId());
            ps.executeUpdate();
            System.out.println("Product updated successfully!");
        } catch (SQLException e) {
            System.err.println("Error updating product: " + e.getMessage());
        }
    }

    @Override
    public void delete(Product product) {
        String sql = "DELETE FROM HD_Product WHERE product_id = ?";
        try {
            PreparedStatement ps = DB.getInstance().getPreparedStatement(sql);
            ps.setInt(1, product.getProductId());
            ps.executeUpdate();
            System.out.println("Product deleted successfully!");
        } catch (SQLException e) {
            System.err.println("Error deleting product: " + e.getMessage());
        }
    }

    @Override
    public List<String> getColumnNames() {
        List<String> columnNames = new ArrayList<>();
        columnNames.add("product_id");
        columnNames.add("product_name");
        columnNames.add("product_description");
        columnNames.add("product_color");
        columnNames.add("product_size");
        columnNames.add("product_price");
        columnNames.add("product_image_url");
        return columnNames;
    }
}