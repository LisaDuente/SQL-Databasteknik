-- example for transactions

DROP DATABASE IF EXISTS TransactionTests;
CREATE DATABASE TransactionTests;

USE TransactionTests;

CREATE TABLE products (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
product_name VARCHAR(60) DEFAULT NULL,
stock INT UNSIGNED DEFAULT NULL,
PRIMARY KEY (id)
);

CREATE TABLE orders (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
product_id INT UNSIGNED NOT NULL,
quantity INT UNSIGNED DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (product_id) REFERENCES products(id)
);

-- SELECT * FROM products
-- SELECT * FROM orders;

-- INSERT INTO products VALUES (null,"basic T-Shirt",10);
-- INSERT INTO orders VALUES (null, 1, 12);

-- UPDATE products SET stock = stock-12 WHERE id = 1;
-- this won't work and now we have to delete the order (because quantity in producs should never be negative)
-- DELETE FROM orders WHERE id = 1;
-- thats why we now use transactions! we can do all statements at a time and then use a rollback
-- example how to use a rollback
 START TRANSACTION;
 INSERT INTO orders VALUES (null, 1, 12);
 UPDATE products SET stock = stock-12 WHERE id = 1;
 -- this one deletes all things that were done in the transaction
 ROLLBACK;
 
 -- example how to use commit
 START TRANSACTION;
 INSERT INTO orders VALUES (null, 1, 8);
 UPDATE products SET stock = stock-8 WHERE id = 1;
 COMMIT;
 