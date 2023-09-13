-- PARTIE 1 --

-- 1 - Liste des contacts français :
SELECT *
FROM customers
WHERE Country = 'France'
	
	
-- 2 - Produits vendus par le fournisseur « Exotic Liquids » :
SELECT ProductName, UnitPrice
FROM products
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE CompanyName = 'Exotic Liquids'


-- 3 - Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant
SELECT CompanyName, COUNT(ProductID) AS 'Nbr produits'
FROM products
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE Country = 'France'
GROUP BY CompanyName
ORDER BY COUNT(ProductID) DESC


-- 4 - Liste des clients Français ayant plus de 10 commandes
SELECT CompanyName, COUNT(OrderID) AS 'Nbr commandes'
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE Country = 'France'
GROUP BY CompanyName
HAVING COUNT(OrderID) > 10


-- 5 - Liste des clients ayant un chiffre d’affaires > 30.000
SELECT CompanyName, SUM(UnitPrice * Quantity) AS 'CA', Country
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN `order details` ON `order details`.OrderID = orders.OrderID
GROUP BY CompanyName
HAVING SUM(UnitPrice * Quantity) > 30000


-- 6 – Liste des pays dont les clients ont passé commande de produits fournis par « Exotic Liquids » 
SELECT ShipCountry
FROM orders
JOIN `order details` ON `order details`.OrderID = orders.OrderID 
JOIN products ON products.ProductID = `order details`.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE CompanyName = 'Exotic Liquids'
GROUP BY ShipCountry


-- 7 – Montant des ventes de 1997
SELECT SUM(Quantity * `order details`.UnitPrice) AS 'Ventes en 97'
FROM `order details`
JOIN orders ON orders.OrderID = `order details`.OrderID
WHERE YEAR(OrderDate) = '1997'


-- 8 – Montant des ventes de 1997 mois par mois
SELECT MONTH(OrderDate) AS 'mois 97', SUM(Quantity * `order details`.UnitPrice) AS 'Ventes en 97'
FROM `order details`
JOIN orders ON orders.OrderID = `order details`.OrderID
WHERE YEAR(OrderDate) = '1997'
GROUP BY MONTH(OrderDate)


-- 9 – Depuis quelle date le client « Du monde entier » n’a plus commandé ?
SELECT MAX(OrderDate) AS 'derniere commande'
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE CompanyName = 'Du monde entier'


-- 10 – Quel est le délai moyen de livraison en jours ?
SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS 'Delai moyen de livraison en jours'
FROM orders


-- PARTIE 2 -- 

-- Pour la requête n°9
DELIMITER |

CREATE PROCEDURE Last_Commande(
    In nomComp varchar (40)
)

BEGIN
	SELECT MAX(OrderDate) AS 'derniere commande'
	FROM customers
	JOIN orders ON orders.CustomerID = customers.CustomerID
	WHERE CompanyName = nomComp;
END

DELIMITER ;

CALL Last_Commande('Alfreds Futterkiste');


localhost:3306/northwind/		http://127.0.0.1/phpmyadmin/index.php?route=/database/sql&db=northwind
La requête SQL a été exécutée avec succès.

SHOW CREATE PROCEDURE Last_Commande;


Last_Commande	STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_...	CREATE DEFINER=`admin`@`localhost` PROCEDURE `Last_Commande`	utf8mb4	utf8mb4_unicode_ci	utf8mb4_general_ci	


-- Pour la requête 10
DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
	SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS 'Delai moyen de livraison en jours'
	FROM orders;
END

DELIMITER ;

CALL AVG_livraison;


localhost:3306/northwind/		http://127.0.0.1/phpmyadmin/index.php?route=/database/sql&db=northwind
La requête SQL a été exécutée avec succès.

SHOW CREATE PROCEDURE AVG_livraison;


AVG_livraison	STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_...	CREATE DEFINER=`admin`@`localhost` PROCEDURE `AVG_livraison`	utf8mb4	utf8mb4_unicode_ci	utf8mb4_general_ci	



-- PARTIE 3 --

-- Ce déclencheur CheckShippingCountry est conçu pour être utilisé dans la table order details. Il vérifiera si le pays du fournisseur du produit (supplierCountry) correspond au pays du client de la commande (customerCountry). Si les pays ne correspondent pas, il générera une erreur.

DELIMITER //

CREATE TRIGGER CheckShippingCountry
BEFORE INSERT ON `order details`
FOR EACH ROW
BEGIN
  DECLARE supplierCountry VARCHAR(15);
  DECLARE customerCountry VARCHAR(15);
  
  SELECT s.Country INTO supplierCountry
  FROM suppliers s
  INNER JOIN products p ON NEW.ProductID = p.ProductID
  WHERE s.SupplierID = p.SupplierID;
  
  SELECT c.Country INTO customerCountry
  FROM customers c
  INNER JOIN orders o ON NEW.OrderID = o.OrderID
  WHERE c.CustomerID = o.CustomerID;
  
  IF supplierCountry <> customerCountry THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Le pays du fournisseur et du client ne correspond pas.';
  END IF;
END;
//

DELIMITER ;
