-- Week 1 Database Assignment
-- Topic: Online Shop
CREATE DATABASE OnlineShopDB;
USE OnlineShopDB;
CREATE TABLE Customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone VARCHAR(20)
);
CREATE TABLE Products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
price DECIMAL(10,2) NOT NULL,
stock_quantity INT DEFAULT 0
);
CREATE TABLE Orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
status VARCHAR(30) DEFAULT 'Pending',
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE OrderItems (
order_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers (first_name,last_name,email,phone) VALUES
('John','Kamau','john@example.com','0712345678'),
('Mary','Wanjiku','mary@example.com','0723456789');
INSERT INTO Products (product_name,price,stock_quantity) VALUES
('Laptop',85000.00,10),
('Wireless Mouse',2500.00,20),
('Keyboard',4500.00,15);
INSERT INTO Orders (customer_id,status) VALUES
(1,'Pending'),
(2,'Completed');
INSERT INTO OrderItems (order_id,product_id,quantity,unit_price) VALUES
(1,1,1,85000.00),
(1,2,2,2500.00),
(2,3,1,4500.00);

