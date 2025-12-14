CREATE TABLE HD_Product (
        product_id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) PRIMARY KEY,
        product_name VARCHAR(100) NOT NULL,
        product_description VARCHAR(500),
        product_color VARCHAR(50),
        product_size VARCHAR(20),
        product_price DECIMAL(10,2) NOT NULL,
        product_image_url VARCHAR(500)
);

INSERT INTO HD_Product (product_name, product_description, product_color, product_size, product_price, product_image_url)
VALUES ('Nike Zoom Vomero Roam', 'Winterized running shoe with durable materials and rubber mudguard for wet weather protection', 'Midnight Navy/World Indigo/Racer Blue/Black', '9.5', 180.00, 'https://static.nike.com/a/images/t_web_pdp_535_v2/f_auto/421f5475-0c06-4c9e-b577-950eb5c82f0c/W+NIKE+ZOOM+VOMERO+ROAM.png');

INSERT INTO HD_Product (product_name, product_description, product_color, product_size, product_price, product_image_url)
VALUES ('Puma LaFrancé RNR Sneakers', 'Flat breathable womens sneakers', 'Pink', '8', 125.00, 'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/312274/01/sv01/fnd/PNA/fmt/png/LaFrancé-RNR-Sneakers');