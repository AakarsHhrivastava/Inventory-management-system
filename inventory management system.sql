-- CREATING TABLE BRAND
CREATE TABLE brand (
   brand_id INT PRIMARY KEY,
   brand_name VARCHAR(255)
);


	-- CREATING TABLE CATEGORIES
CREATE TABLE categories (
   category_id INT PRIMARY KEY,
   category_name VARCHAR(255)
);


-- CREATING TABLE PRODUCT
create table product(product_id int primary key,
catogory_id int references catogories(category_id),
brand_id int references brand(brand_id ),
s_id int,
product_name varchar(20),
product_stock int,
price int,
added_date date
 );


 -- CREATING TABLE STORES
CREATE TABLE stores (
   store_id INT PRIMARY KEY,
   store_name VARCHAR(255),
   address VARCHAR(255),
   mob_no int
);


-- CREATING TABLE PROVIDES
CREATE TABLE provides (
   brand_id INT,
   store_id INT,
   discount INT,
   FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
   FOREIGN KEY (store_id) REFERENCES stores(store_id)
);


-- CREATING TABLE CUSTOMER_CART
CREATE TABLE customer_cart (
   cust_id INT PRIMARY KEY,
   name VARCHAR(20),
   mob_no int
);


-- CREATING TABLE SELECT_PRODUCT
CREATE TABLE select_product (
   cust_id INT,
   product_id INT,
   quantity INT,
   FOREIGN KEY (cust_id) REFERENCES customer_cart(cust_id),
   FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- CREATING TABLER TRANSACTION
CREATE TABLE transaction (
   id INT PRIMARY KEY,
   total_amount INT,
   paid INT,
   due INT,
   gst INT,
   discount INT,
   payment_method VARCHAR(10),
   cart_id INT,
   FOREIGN KEY (cart_id) REFERENCES customer_cart(cust_id)
);


-- CREATING TABLE INVOICE
CREATE TABLE invoice (
   item_no INT,
   product_name VARCHAR(20),
   quantity INT,
   net_price INT,
   transaction_id INT,
   FOREIGN KEY (transaction_id) REFERENCES transaction(id)
);


-- INSERT INTO BRAND
INSERT INTO brand (brand_id, brand_name) VALUES
(2, 'Samsung'),
(3, 'Nike'),
(4, 'Fortune'),
(1, 'Apple');


-- INSER INTO CATEGORIES
INSERT INTO categories (category_id, category_name)  
VALUES (1, 'Electronics');

INSERT INTO categories (category_id, category_name)  
VALUES (2, 'Clothing');

INSERT INTO categories (category_id, category_name)  
VALUES (3, 'Grocey');


-- INSERT INTO STORES
INSERT INTO stores (store_id, store_name, address, mob_no)  
VALUES (1, 'Aakarsh', 'Katpadi vellore', '99999999');

INSERT INTO stores (store_id, store_name, address, mob_no) 
VALUES (2,'Aditya','kota',88885555);

INSERT INTO stores (store_id, store_name, address, mob_nO) 
VALUES (3,'Shivam','Haryana',77775555);


-- INSERT INTO PRODUCT
INSERT INTO product (product_id, catogory_id , brand_id, s_id, product_name, product_stock, price, added_date) 
VALUES (1, 1, 1, 1, 'IPHONE', 4, 45000, '23-10-20');

INSERT INTO product (product_id, catogory_id , brand_id, s_id, product_name, product_stock, price, added_date) 
VALUES (2, 1, 1, 1, 'Airpods', 3, 19000, '27-10-20');

INSERT INTO product (product_id, catogory_id , brand_id, s_id, product_name, product_stock, price, added_date) 
VALUES (3, 1, 1, 1, 'Smart Watch', 3, 19000, '27-10-20');

INSERT INTO product (product_id, catogory_id , brand_id, s_id, product_name, product_stock, price, added_date) 
VALUES (4, 2, 3, 2, 'Mac book', 6, 7000, '27-10-20');

INSERT INTO product (product_id, catogory_id , brand_id, s_id, product_name, product_stock, price, added_date) 
VALUES (5, 3, 4, 3, 'REFINED OIL', 6, 750, '10-11-20');


-- INSERT INTO PROVIDES
INSERT INTO provides (brand_id, store_id, discount ) 
VALUES (1, 1, 20), (2, 2, 5), (3, 3, 15), (1, 2, 10), (4, 2, 10), (4, 3, 20);


-- INSERT INTO CUSTOMER_CART
INSERT INTO customer_cart (cust_id, name, mob_no) 
VALUES (1, 'Shivain', 974387834);

INSERT INTO customer_cart (cust_id, name, mob_no) 
VALUES (2, 'Harsh', 77777744);

INSERT INTO customer_cart (cust_id, name, mob_no) 
VALUES  (3, 'Parth', 77777775);


-- INSERT INTO SELECT_PRODUCT
INSERT INTO select_product (cust_id, product_id, quantity) 
VALUES (1, 2, 2);

INSERT INTO select_product (cust_id, product_id, quantity) 
VALUES (1, 3, 1);

INSERT INTO select_product (cust_id, product_id, quantity) 
VALUES (2, 3, 3);

INSERT INTO select_product (cust_id, product_id, quantity) 
VALUES (3, 2, 1);


-- INSERT INTO TRANSACTION
INSERT INTO transaction (id, total_amount, paid, due, gst, discount, payment_method, cart_id) 
VALUES (1, 57000, 2000, 5000, 350, 350, 'card', 1);

INSERT INTO transaction (id, total_amount, paid, due, gst, discount, payment_method, cart_id) 
VALUES (2,57000,57000,0,570,570,'cash',2);

INSERT INTO transaction (id, total_amount, paid, due, gst, discount, payment_method, cart_id) 
VALUES (3,19000,17000,2000,190,190,'cash',3);

select * from product
