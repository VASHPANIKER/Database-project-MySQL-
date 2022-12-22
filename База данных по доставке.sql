DROP DATABASE IF EXISTS delivery_service;
CREATE DATABASE IF NOT EXISTS delivery_service;
USE delivery_service;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	phone_number VARCHAR(20) NOT NULL,
	district VARCHAR(15) NOT NULL,
	street VARCHAR(25) NOT NULL,
	house INT NOT NULL,
	apartment INT NOT NULL
);

INSERT INTO customers(first_name, last_name, phone_number, district, street, house, apartment) VALUES
('Юлия', 'Дмитриева', '32(58)54222', 'South', 'пр. Домодедовская', 1, 10),
('Тимур', 'Богданов', '8(7036)83283', 'West', 'ул. Сталина', 2, 35),
('Давид', 'Никитин', '7(544)76135', 'East', 'шоссе Бухарестская', 77, 14),
('Дарья', 'Васильева', '8(30)49019', 'South', 'наб. Ломоносова', 24, 89),
('Леонид', 'Смирнов', '71(141)68923', 'South', 'проезд Ладыгина', 11, 85),
('Лейла', 'Гусева', '20(44)53683', 'West', 'пр. Косиора', 123, 52),
('Владимир', 'Черных', '339(232)74899', 'West', 'спуск Ленина', 76, 44),
('Маргарита', 'Бабушкина', '88(1292)46899', 'East', 'пер. Чехова', 21, 91),
('Камилла', 'Сидорова', '83(17)59683', 'North', 'пер. Гагарина', 23, 67),
('Маргарита', 'Зайцева', '22(17)95215', 'South', 'шоссе Чехова', 62, 44),
('Анастасия', 'Щербакова', '280(721)56237', 'South', 'бульвар Домодедовская', 15, 56),
('Юлия', 'Соколова', '8(604)09778', 'South', 'наб. Косиора', 5, 13),
('София', 'Петрова', '8(813)93576', 'North', 'наб. Ленина', 18, 88),
('София', 'Михайлова', '923(51)37841', 'North', 'въезд Космонавтов', 17, 7),
('Богдан', 'Зуев', '4(81)80571', 'South', 'шоссе Будапештсткая', 18, 9);

CREATE TABLE courier_info (
	courier_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	phone_number VARCHAR(20) NOT NULL,
	delivery_type VARCHAR(5) NOT NULL
);

INSERT INTO courier_info(first_name, last_name, phone_number, delivery_type) VALUES
('Лидия', 'Прудникова', '+7 (999) 254-76-46', 'foot'),
('Никита', 'Лигачёв', '+7 (910) 396-98-95', 'car'),
('Марьяна', 'Катькина', '+7 (948) 547-80-79', 'car'),
('Василий', 'Сиянковский', '+7 (943) 891-61-90', 'car');


CREATE TABLE products
(product_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
product_name VARCHAR(80) NOT NULL,
price FLOAT NOT NULL);

INSERT INTO products(product_name, price) VALUES
('Сыр', 120.6),
('Картофель', 75.7),
('Рис', 14.4),
('Молоко', 14.1),
('Сахар', 25.5),
('Лук', 10.5),
('Майонез', 12.0),
('Сметана', 13.75),
('Кофе', 34.1),
('Минеральная  вода', 20.0);

CREATE TABLE orders
(order_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
customer_id INT NOT NULL,
date_get TIMESTAMP NOT NULL,  # время поступления заказов от клиентов
FOREIGN KEY (customer_id) REFERENCES customers (customer_id));

INSERT INTO orders(customer_id, date_get) VALUES
(1, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(2, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(3, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(4, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(5, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(6, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(7, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(8, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(9, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(10, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(11, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(12, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(13, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(14, NOW());
INSERT INTO orders(customer_id, date_get) VALUES
(15, NOW());


CREATE TABLE orders_products
(order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id));

INSERT INTO orders_products VALUES
(1, 1, 2), (1, 4, 1), (1, 10, 1),
(2, 4, 1), (2, 5, 1),
(3, 3, 1),
(4, 7, 2), 
(5, 2, 1), (5, 3, 1),
(6, 8, 3),
(7, 1, 1), (7, 6, 4),
(8, 1, 2),
(9, 2, 1), (9, 3, 1),
(10, 1, 2), (10, 2, 1),
(12, 5, 2), (12, 10, 1),
(13, 4, 2),
(14, 5, 1),
(15, 8, 1), (15, 7, 2);

CREATE TABLE delivery_list
(delivery_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
order_id INT UNIQUE NOT NULL,
courier_id INT NOT NULL,
date_arrived TIMESTAMP UNIQUE,  # время, когда курьер привёз заказ клиенту
payment_method VARCHAR(4),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (courier_id) REFERENCES courier_info(courier_id));

INSERT INTO delivery_list VALUES
(1, 1, 3, '2022-11-12 17:59:15', 'Cash'),
(2, 2, 4, '2022-11-12 18:01:05', 'Card'),
(3, 3, 1, '2022-11-12 18:04:36', 'Cash'),
(4, 4, 2, '2022-11-12 18:03:11', 'Cash'),
(5, 5, 1, '2022-11-12 18:19:56', 'Cash'),
(6, 6, 3, '2022-11-12 18:18:44', 'Card'),
(7, 7, 2, '2022-11-12 18:50:11', 'Card'),
(8, 8, 4, '2022-11-12 18:35:07', 'Card'),
(9, 9, 4, '2022-11-12 18:58:28', 'Cash'),
(10, 10, 3, '2022-11-12 18:36:51', 'Card'),
(11, 11, 2, '2022-11-12 19:10:34', 'Cash'),
(12, 12, 1, '2022-11-12 19:17:04', 'Cash'),
(13, 13, 2, '2022-11-12 19:23:04', 'Cash'),
(14, 14, 3, '2022-11-12 18:56:17', 'Card'),
(15, 15, 4, '2022-11-12 19:05:29', 'Card');

-- ЗАПРОСЫ

-- Выборка клиентов, которые живут в районе "South":

SELECT * FROM Customers
WHERE district IN ('South');

-- Сколько каждый курьер доставил заказов:

SELECT courier_id, COUNT(order_id) FROM delivery_list
GROUP BY courier_id;

-- Получаем общую таблицу с информацией о клиентах и курьеров:

SELECT 'Customer' AS category, first_name, last_name, phone_number FROM customers 
UNION
SELECT 'Employee' AS category, first_name, last_name, phone_number FROM courier_info;

-- запрос, который позволяет видеть детали заказа

SELECT orders_products.order_id, products.product_name, quantity,
ROUND(price * quantity, 2) AS total_price FROM orders_products
JOIN products ON orders_products.product_id = products.product_id
ORDER BY order_id, quantity;

-- запрос на информацию об имени клиента, его мобильном телефоне и номере заказа

SELECT customers.first_name, customers.last_name, customers.phone_number, orders.order_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
