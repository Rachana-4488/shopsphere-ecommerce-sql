IN ORACLE INT = NUMBER and VARCHAR = VARCHAR2
#Task 1 : Create CATEGORIES : category_id       NUMBER        PRIMARY KEY, category_name     VARCHAR2(50)  NOT NULL
CREATE TABLE CATEGORIES (
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2(50) NOT NULL
)

#Task 2 — Create PRODUCTS : product_id NUMBER, product_name VARCHAR2(100), category_id NUMBER, price NUMBER(10,2), stock_quantity NUMBER
CREATE TABLE PRODUCTS (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    category_id NUMBER NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity NUMBER,
    
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id)
)

#Task 3 — Create CUSTOMERS : customer_id NUMBER, customer_name VARCHAR2(100), email VARCHAR2(150), city VARCHAR2(50), registration_date    DATE
CREATE TABLE CUSTOMERS (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(150),
    city VARCHAR2(50),
    registration_date DATE DEFAULT (CURRENT_DATE)
)

#Task 4 — Create ORDERS : order_id NUMBER, customer_id       NUMBER, order_date        DATE, order_status      VARCHAR2(30), payment_method    VARCHAR2(30)
CREATE TABLE ORDERS (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE DEFAULT (CURRENT_DATE) NOT NULL,
    order_status VARCHAR(30),
    payment_method VARCHAR(30),
    
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
)

#Task 5 — Create ORDER_ITEMS : order_item_id NUMBER, order_id NUMBER, product_id NUMBER, quantity NUMBER, unit_price       NUMBER(10,2)
CREATE TABLE ORDER_ITEMS (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id)
)

#Task 6 : Add Constraints : Product price cannot be negative., Stock cannot be negative., Order-item quantity must be greater than 0., Order-item unit price cannot be negative.
Order status must be one of: Completed, Shipped, Pending, Cancelled., Payment method must be one of: Credit Card, UPI, Net Banking, Cash on Delivery.

ALTER TABLE products
ADD CONSTRAINT chk_product_price
CHECK (price >= 0);

ALTER TABLE products
ADD CONSTRAINT chk_product_stock
CHECK (stock_quantity >= 0);

ALTER TABLE order_items
ADD CONSTRAINT chk_order_item_quantity
CHECK (quantity > 0);

ALTER TABLE order_items
ADD CONSTRAINT chk_order_item_unit_price
CHECK (unit_price >= 0);

ALTER TABLE orders
ADD CONSTRAINT chk_order_status
CHECK (order_status IN (
    'Completed',
    'Shipped',
    'Pending',
    'Cancelled'
));

ALTER TABLE orders
ADD CONSTRAINT chk_payment_method
CHECK (payment_method IN (
    'Credit Card',
    'UPI',
    'Net Banking',
    'Cash on Delivery'
));

#Task 7 : Insert Categories
INSERT INTO categories (category_id, category_name)
VALUES (1, 'Electronics');

INSERT INTO categories (category_id, category_name)
VALUES (2, 'Stationery');

INSERT INTO categories (category_id, category_name)
VALUES (3, 'Fitness');

INSERT INTO categories (category_id, category_name)
VALUES (4, 'Home And Kitchen');

INSERT INTO categories (category_id, category_name)
VALUES (5, 'Beauty');

INSERT INTO categories (category_id, category_name)
VALUES (6, 'Accessories');

#Task 8 : Insert Products 
INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(101, 'Wireless Mouse', 1, 799, 45);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(102, 'Mechanical Keyboard', 1, 2499, 25);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(103, 'Bluetooth Headphones', 1, 1999, 30);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(104, 'Notebook', 2, 299, 100);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(105, 'Premium Pen Set', 2, 499, 80);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(106, 'Desk Organizer', 2, 699, 50);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(107, 'Yoga Mat', 3, 999, 40);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(108, 'Cricket Bat', 3, 3499, 15);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(109, 'Water Bottle', 3, 599, 60);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(110, 'Coffee Maker', 4, 4499, 12);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(111, 'Non-Stick Pan', 4, 1599, 20);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(112, 'Face Wash', 5, 399, 70);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(113, 'Hair Dryer', 5, 1799, 18);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(114, 'Leather Wallet', 6, 1299, 35);

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(115, 'Backpack', 6, 1899, 25);

#Task 9 : Insert Customers
INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(201, 'Aarav Shah', 'aarav.shah@example.com', 'Ahmedabad',
 DATE '2025-01-15');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(202, 'Diya Patel', 'diya.patel@example.com', 'Gandhinagar',
 DATE '2025-02-20');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(203, 'Rohan Mehta', 'rohan.mehta@example.com', 'Mumbai',
 DATE '2025-03-10');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(204, 'Ananya Desai', 'ananya.desai@example.com', 'Pune',
 DATE '2025-03-25');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(205, 'Kabir Joshi', 'kabir.joshi@example.com', 'Delhi',
 DATE '2025-04-12');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(206, 'Meera Trivedi', 'meera.trivedi@example.com', 'Ahmedabad',
 DATE '2025-05-05');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(207, 'Vivaan Shah', 'vivaan.shah@example.com', 'Bengaluru',
 DATE '2025-05-18');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(208, 'Ishita Patel', 'ishita.patel@example.com', 'Surat',
 DATE '2025-06-01');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(209, 'Arjun Desai', 'arjun.desai@example.com', 'Jaipur',
 DATE '2025-06-15');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(210, 'Sara Mehta', 'sara.mehta@example.com', 'Vadodara',
 DATE '2025-07-02');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(211, 'Nikhil Patel', 'nikhil.patel@example.com', 'Rajkot',
 DATE '2025-07-20');

INSERT INTO customers
(customer_id, customer_name, email, city, registration_date)
VALUES
(212, 'Tara Shah', 'tara.shah@example.com', 'Nashik',
 DATE '2025-08-05');
 
#Task 10 : Insert Orders
INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1001, 201, DATE '2025-08-01', 'Completed', 'UPI');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1002, 202, DATE '2025-08-03', 'Completed', 'Credit Card');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1003, 203, DATE '2025-08-05', 'Shipped', 'UPI');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1004, 201, DATE '2025-08-08', 'Completed', 'Credit Card');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1005, 204, DATE '2025-08-10', 'Completed', 'Net Banking');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1006, 205, DATE '2025-08-12', 'Cancelled', 'UPI');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1007, 206, DATE '2025-08-15', 'Completed', 'Credit Card');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1008, 207, DATE '2025-08-18', 'Shipped', 'UPI');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1009, 202, DATE '2025-08-20', 'Completed', 'UPI');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1010, 208, DATE '2025-08-22', 'Pending', 'Cash on Delivery');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1011, 209, DATE '2025-08-25', 'Completed', 'Credit Card');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1012, 203, DATE '2025-08-27', 'Completed', 'UPI');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1013, 210, DATE '2025-08-29', 'Shipped', 'Net Banking');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1014, 206, DATE '2025-09-01', 'Completed', 'UPI');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1015, 211, DATE '2025-09-03', 'Completed', 'Credit Card');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1016, 212, DATE '2025-09-05', 'Completed', 'UPI');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1017, 205, DATE '2025-09-07', 'Completed', 'Cash on Delivery');

INSERT INTO orders
(order_id, customer_id, order_date, order_status, payment_method)
VALUES
(1018, 204, DATE '2025-09-10', 'Completed', 'Credit Card');

#Task 11 :Insert Order_items
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 2, 799);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(2, 1001, 104, 3, 299);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(3, 1002, 102, 1, 2499);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(4, 1002, 105, 2, 499);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(5, 1003, 103, 1, 1999);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(6, 1003, 109, 2, 599);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(7, 1004, 108, 1, 3499);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(8, 1004, 107, 1, 999);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(9, 1005, 110, 1, 4499);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(10, 1005, 111, 1, 1599);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(11, 1006, 114, 1, 1299);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(12, 1007, 113, 1, 1799);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(13, 1007, 112, 2, 399);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(14, 1008, 115, 1, 1899);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(15, 1008, 106, 1, 699);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(16, 1009, 104, 5, 299);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(17, 1009, 105, 1, 499);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(18, 1010, 109, 1, 599);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(19, 1011, 102, 1, 2499);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(20, 1011, 101, 1, 799);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(21, 1012, 108, 1, 3499);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(22, 1012, 109, 2, 599);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(23, 1013, 110, 1, 4499);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(24, 1014, 103, 1, 1999);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(25, 1014, 105, 2, 499);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(26, 1015, 107, 2, 999);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(27, 1015, 109, 1, 599);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(28, 1016, 114, 1, 1299);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(29, 1016, 115, 1, 1899);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(30, 1017, 113, 1, 1799);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(31, 1017, 112, 3, 399);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(32, 1018, 111, 1, 1599);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(33, 1018, 110, 1, 4499);

#Task 12 : Commit
Commit

#Task 13 : Validate entered data
SELECT COUNT(*) FROM categories;

SELECT COUNT(*) FROM products;

SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM order_items;

Test complete relations between tables
SELECT c.customer_name,
       o.order_id,
       o.order_date,
       p.product_name,
       oi.quantity,
       oi.unit_price
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;


SELECT * FROM customers
SELECT * FROM orders WHERE customer_id = 201
SELECT * FROM products
SELECT * FROM categories
SELECT * FROM order_items where product_id IN (101, 102, 103)