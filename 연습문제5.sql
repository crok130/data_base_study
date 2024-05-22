CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 샘플 데이터 삽입
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 1000.00, 10),
('Smartphone', 'Electronics', 600.00, 20),
('Tablet', 'Electronics', 400.00, 30),
('Headphones', 'Accessories', 50.00, 100),
('Charger', 'Accessories', 20.00, 150);

INSERT INTO sales (product_id, sale_date, quantity) VALUES
(1, '2023-01-10', 2),
(2, '2023-01-12', 1),
(3, '2023-01-15', 3),
(1, '2023-01-20', 1),
(4, '2023-01-25', 5);