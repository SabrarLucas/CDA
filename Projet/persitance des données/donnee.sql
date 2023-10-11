INSERT INTO Suppliers (id_suppliers, name) VALUES
(1, 'nom-1'),
(2, 'nom-2'),
(3, 'nom-3'),
(4, 'nom-4'),
(5, 'nom-5');

INSERT INTO Categories (id_categories, name, image, parent_cat) VALUES
(1, 'cat-1', 'url/image-1.jpeg', NULL),
(2, 'cat-2', 'url/image-2.jpeg', 1),
(3, 'cat-3', 'url/image-3.jpeg', 1),
(4, 'cat-4', 'url/image-4.jpeg', 1),
(5, 'cat-5', 'url/image-5.jpeg', 1);

INSERT INTO Products (id_products, name, description, price, image, id_suppliers, id_categories) VALUES
(1, 'produit-1', 'La description pour le produit 1', 23.99, 'url/image-1.jpeg', 1, 1),
(2, 'produit-2', 'La description pour le produit 2', 23.99, 'url/image-2.jpeg', 1, 1),
(3, 'produit-3', 'La description pour le produit 3', 23.99, 'url/image-3.jpeg', 2, 2),
(4, 'produit-4', 'La description pour le produit 4', 23.99, 'url/image-4.jpeg', 2, 2),
(5, 'produit-5', 'La description pour le produit 5', 23.99, 'url/image-5.jpeg', 3, 3),
(6, 'produit-6', 'La description pour le produit 6', 23.99, 'url/image-6.jpeg', 3, 3),
(7, 'produit-7', 'La description pour le produit 7', 23.99, 'url/image-7.jpeg', 4, 4),
(8, 'produit-8', 'La description pour le produit 8', 23.99, 'url/image-8.jpeg', 4, 4),
(9, 'produit-9', 'La description pour le produit 9', 23.99, 'url/image-9.jpeg', 5, 5),
(10, 'produit-10', 'La description pour le produit 10', 23.99, 'url/image-10.jpeg', 5, 5);

INSERT INTO Users (id_users, email, roles, firstname, lastname, password, addresse, zipcode, city, created_at) VALUES
(1, 'email1@mail.com', 'ADMIN', 'firstname-1', 'lastname-1', 'mdp', 'addr-1', '11111', 'city-1', 20231011),
(2, 'email2@mail.com', 'ADMIN', 'firstname-2', 'lastname-2', 'mdp', 'addr-2', '22222', 'city-2', 20231011),
(3, 'email3@mail.com', 'ADMIN', 'firstname-3', 'lastname-3', 'mdp', 'addr-3', '33333', 'city-3', 20231011),
(4, 'email4@mail.com', 'ADMIN', 'firstname-4', 'lastname-4', 'mdp', 'addr-4', '44444', 'city-4', 20231011),
(5, 'email5@mail.com', 'ADMIN', 'firstname-5', 'lastname-5', 'mdp', 'addr-5', '55555', 'city-5', 20231011),
(6, 'email6@mail.com', 'ADMIN', 'firstname-6', 'lastname-6', 'mdp', 'addr-6', '66666', 'city-6', 20231011),
(7, 'email7@mail.com', 'ADMIN', 'firstname-7', 'lastname-7', 'mdp', 'addr-7', '77777', 'city-7', 20231011),
(8, 'email8@mail.com', 'ADMIN', 'firstname-8', 'lastname-8', 'mdp', 'addr-8', '88888', 'city-8', 20231011),
(9, 'email9@mail.com', 'ADMIN', 'firstname-9', 'lastname-9', 'mdp', 'addr-9', '99999', 'city-9', 20231011),
(10, 'email10@mail.com', 'ADMIN', 'firstname-10', 'lastname-10', 'mdp', 'addr-10', '10000', 'city-10', 20231011),
(11, 'email11@mail.com', 'ADMIN', 'firstname-11', 'lastname-11', 'mdp', 'addr-11', '11000', 'city-11', 20231011),
(12, 'email12@mail.com', 'ADMIN', 'firstname-12', 'lastname-12', 'mdp', 'addr-12', '12000', 'city-12', 20231011),
(13, 'email13@mail.com', 'ADMIN', 'firstname-13', 'lastname-13', 'mdp', 'addr-13', '13000', 'city-13', 20231011),
(14, 'email14@mail.com', 'ADMIN', 'firstname-14', 'lastname-14', 'mdp', 'addr-14', '14000', 'city-14', 20231011),
(15, 'email15@mail.com', 'ADMIN', 'firstname-15', 'lastname-15', 'mdp', 'addr-15', '15000', 'city-15', 20231011);

INSERT INTO Orders (id_orders, created_at, delivery, status, id_users) VALUES
(1, 20231011, 20231011, 'livré', 1),
(2, 20231011, 20231011, 'livré', 1),
(3, 20231011, 20231011, 'livré', 5),
(4, 20231011, NULL, 'en preparation', 13),
(5, 20231011, 20231011, 'livré', 8),
(6, 20231011, 20231011, 'livré', 7),
(7, 20231011, 20231011, 'livré', 10),
(8, 20231011, NULL, 'en cours', 3),
(9, 20231011, 20231011, 'livré', 9),
(10, 20231011, NULL, 'en attente de paiment', 15);

INSERT INTO Factures (id_factures, created_at, payment, id_orders, to_pay) VALUES
(1, 20231011, 'CB', 1, 95.96),
(2, 20231011, 'CB', 2, 95.96),
(3, 20231011, 'CB', 3, 95.96),
(4, 20231011, 'CB', 4, 95.96),
(5, 20231011, 'CB', 5, 95.96),
(6, 20231011, 'CB', 6, 95.96),
(7, 20231011, 'CB', 7, 95.96),
(8, 20231011, 'CB', 8, 95.96),
(9, 20231011, 'CB', 9, 95.96),
(10, 20231011, 'cheque', 10, 95.96);

INSERT INTO Products_Orders (id_orders, id_products, quantity, price_tot) VALUES 
(1, 3, 4, 95.96),
(2, 6, 4, 95.96),
(3, 1, 4, 95.96),
(4, 4, 4, 95.96),
(5, 10, 4, 95.96),
(6, 9, 4, 95.96),
(7, 3, 4, 95.96),
(8, 6, 4, 95.96),
(9, 2, 4, 95.96),
(10, 8, 4, 95.96);


INSERT INTO Deliveries (id_deliveries, quantity, carrier, date_del, id_orders) VALUES
(1, 4, 'amazon', 20231011, 1),
(2, 4, 'amazon', 20231011, 2),
(3, 4, 'amazon', 20231011, 3),
(4, 0, 'amazon', 20231011, 4),
(5, 4, 'amazon', 20231011, 5),
(6, 4, 'amazon', 20231011, 6),
(7, 4, 'amazon', 20231011, 7),
(8, 2, 'amazon', 20231011, 8),
(9, 4, 'amazon', 20231011, 9),
(10, 0, 'amazon', 20231011, 10);
