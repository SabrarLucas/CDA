-- 1. Chiffre d'affaires mois par mois pour une année sélectionnée

SELECT
    DATE_FORMAT(Factures.created_at, '%Y-%m') AS Mois,
    SUM(Factures.to_pay) AS Chiffre_d_affaires
FROM
    Factures
WHERE
    YEAR(Factures.created_at) = 2023
GROUP BY
    Mois
ORDER BY
    Mois;

-- 2. Chiffre d'affaires généré pour un fournisseur

SELECT
    Suppliers.name AS Fournisseur,
    SUM(Factures.to_pay) AS Chiffre_d_affaires
FROM
    Suppliers
INNER JOIN Products ON Suppliers.id_suppliers = Products.id_suppliers
INNER JOIN Products_Orders ON Products.id_products = Products_Orders.id_products
INNER JOIN Factures ON Products_Orders.id_orders = Factures.id_orders
GROUP BY
    Suppliers.name
HAVING
    Suppliers.name = 'nom-1'; 


-- 3. TOP 10 des produits les plus commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)

SELECT
    P.id_products AS Référence,
    P.name AS Nom_du_produit,
    SUM(PO.quantity) AS Quantité_commandée,
    S.name AS Fournisseur
FROM
    Products_Orders AS PO
INNER JOIN Orders AS O ON PO.id_orders = O.id_orders
INNER JOIN Products AS P ON PO.id_products = P.id_products
INNER JOIN Suppliers AS S ON P.id_suppliers = S.id_suppliers
WHERE
    YEAR(O.created_at) = 2023
GROUP BY
    P.id_products, P.name, S.name
ORDER BY
    SUM(PO.quantity) DESC
LIMIT 10;


-- 4. TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur)

SELECT
    Products.id_products AS Référence,
    Products.name AS Nom_du_produit,
    (SUM(Products_Orders.quantity) * Products.price - (SUM(Products_Orders.quantity) * Products.price)) AS Marge,
    Suppliers.name AS Fournisseur
FROM
    Products_Orders
INNER JOIN Orders ON Products_Orders.id_orders = Orders.id_orders
INNER JOIN Products ON Products_Orders.id_products = Products.id_products
INNER JOIN Suppliers ON Products.id_suppliers = Suppliers.id_suppliers
WHERE
    YEAR(Orders.created_at) = 2023  -- Remplacez '2023' par l'année souhaitée
GROUP BY
    Products.id_products, Products.name, Suppliers.name
ORDER BY
    Marge DESC
LIMIT 10;


-- 5. Top 10 des clients en nombre de commandes ou chiffre d'affaires

SELECT
    Users.id_users AS ID_Client,
    CONCAT(Users.firstname, ' ', Users.lastname) AS Nom_Client,
    COUNT(Orders.id_orders) AS Nombre_de_Commandes
FROM
    Users
LEFT JOIN Orders ON Users.id_users = Orders.id_users
GROUP BY
    ID_Client, Nom_Client
ORDER BY
    Nombre_de_Commandes DESC
LIMIT 10;


-- 6. Répartition du chiffre d'affaires par type de client

SELECT
    Users.type_client AS Type_de_Client,
    SUM(Factures.to_pay) AS Chiffre_dAffaires
FROM
    Users
LEFT JOIN Orders ON Users.id_users = Orders.id_users
LEFT JOIN Factures ON Orders.id_orders = Factures.id_orders
GROUP BY
    Type_de_Client


-- 7. Nombre de commandes en cours de livraison.

SELECT COUNT(*) AS Nombre_de_Commandes_En_Cours_de_Livraison
FROM Orders
WHERE status = 'en preparation' OR status = 'en cours';



-- Créez une procédure stockée qui sélectionne les commandes non soldées (en cours de livraison)

DELIMITER //
CREATE PROCEDURE SelectNonSoldOrders()
BEGIN
    SELECT * FROM Orders WHERE status IN ('en preparation', 'en cours');
END;
//
DELIMITER ;


CALL SelectNonSoldOrders();


-- puis une autre qui renvoie le délai moyen entre la date de commande et la date de facturation.

DELIMITER //
CREATE PROCEDURE CalculateAverageOrderToInvoiceDelay()
BEGIN
    SELECT AVG(DATEDIFF(Factures.created_at, Orders.created_at)) AS Délai_Moyen
    FROM Factures
    JOIN Orders ON Factures.id_orders = Orders.id_orders;
END;
//
DELIMITER ;


CALL CalculateAverageOrderToInvoiceDelay();



-- Créez une vue correspondant à la jointure Produits - Fournisseurs

CREATE VIEW ProductSupplierView AS
SELECT *
FROM Products
INNER JOIN Suppliers ON Products.id_suppliers = Suppliers.id_suppliers;


SELECT * FROM ProductSupplierView;


-- Créez une vue correspondant à la jointure Produits - Catégorie/Sous catégorie

CREATE VIEW ProductCategoryView AS
SELECT
    P.id_products AS ProductID,
    P.name AS ProductName,
    P.description AS ProductDescription,
    P.price AS ProductPrice,
    P.image AS ProductImage,
    C.id_categories AS CategoryID,
    C.name AS CategoryName,
    C.image AS CategoryImage,
    SC.id_categories AS SubCategoryID,
    SC.name AS SubCategoryName,
    SC.image AS SubCategoryImage
FROM Products AS P
INNER JOIN Categories AS C ON P.id_categories = C.id_categories
LEFT JOIN Categories AS SC ON P.id_categories = SC.parent_cat;


SELECT * FROM ProductCategoryView;
