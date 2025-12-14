package entity;

public class Product {
    private int productId;
    private String productName;
    private String productDescription;
    private String productColor;
    private String productSize;
    private double productPrice;
    private String productImageUrl;

    // Default constructor
    public Product() {
    }

    // Constructor with all fields except ID (for new products)
    public Product(String productName, String productDescription, String productColor,
                   String productSize, double productPrice, String productImageUrl) {
        this.productName = productName;
        this.productDescription = productDescription;
        this.productColor = productColor;
        this.productSize = productSize;
        this.productPrice = productPrice;
        this.productImageUrl = productImageUrl;
    }

    // Constructor with all fields including ID
    public Product(int productId, String productName, String productDescription,
                   String productColor, String productSize, double productPrice,
                   String productImageUrl) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productColor = productColor;
        this.productSize = productSize;
        this.productPrice = productPrice;
        this.productImageUrl = productImageUrl;
    }

    // Getters and Setters
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductColor() {
        return productColor;
    }

    public void setProductColor(String productColor) {
        this.productColor = productColor;
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImageUrl() {
        return productImageUrl;
    }

    public void setProductImageUrl(String productImageUrl) {
        this.productImageUrl = productImageUrl;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productDescription='" + productDescription + '\'' +
                ", productColor='" + productColor + '\'' +
                ", productSize='" + productSize + '\'' +
                ", productPrice=" + productPrice +
                ", productImageUrl='" + productImageUrl + '\'' +
                '}';
    }
}