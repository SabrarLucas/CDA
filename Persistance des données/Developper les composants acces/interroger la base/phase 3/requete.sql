-- 1. Quelles sont les commandes du fournisseur 09120 ?

	SELECT numcom
	FROM entcom
	WHERE numfou = 9120


-- 2. Afficher le code des fournisseurs pour lesquels des commandes ont été passées.

	SELECT entcom.numfou
	FROM entcom
	GROUP BY numfou


-- 3. Afficher le nombre de commandes fournisseurs passées, et le nombre de fournisseur concernés.

	SELECT COUNT(entcom.numcom) AS 'Nb commande', COUNT(DISTINCT entcom.numfou) AS 'Nb fournisseur' 
	FROM entcom


-- 4. Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la quantité annuelle est inférieur est inférieure à 1000 (informations à fournir : n° produit, libellé produit, stock, stock actuel d'alerte, quantité annuelle)

	SELECT codart, libart, stkphy, stkale, qteann 
	FROM produit
	WHERE stkphy <= stkale AND qteann < 1000


-- 5. Quels sont les fournisseurs situés dans les départements 75 78 92 77 ? L’affichage (département, nom fournisseur) sera effectué par département décroissant, puis par ordre alphabétique

	SELECT posfou, nomfou
	FROM fournis
	WHERE LEFT (posfou, 2) = '75' OR LEFT (posfou, 2) = '78' OR LEFT (posfou, 2) = '92' OR LEFT (posfou, 2) = '77'
	ORDER BY posfou DESC, nomfou ASC


-- 6. Quelles sont les commandes passées au mois de mars et avril ?

	SELECT numcom
	FROM entcom
	WHERE MONTH(datcom) = '03' OR MONTH(datcom) = '04'


-- 7. Quelles sont les commandes du jour qui ont des observations particulières ? (Affichage numéro de commande, date de commande)

	SELECT numcom, datcom
	FROM entcom
	WHERE obscom != ''


-- 8. Lister le total de chaque commande par total décroissant (Affichage numéro de commande et total)

	SELECT numcom, SUM(qtecde*priuni) AS 'Total commande'
	FROM ligcom
	GROUP BY numcom
	ORDER BY SUM(qtecde*priuni) DESC 


-- 9. Lister les commandes dont le total est supérieur à 10 000€ ; on exclura dans le calcul du total les articles commandés en quantité supérieure ou égale à 1000. (Affichage numéro de commande et total)

	SELECT numcom, SUM(qtecde*priuni) AS 'Total commande'
	FROM ligcom	
	WHERE qtecde < 1000
	GROUP BY numcom
	HAVING SUM(qtecde*priuni) > 10000


-- 10. Lister les commandes par nom fournisseur (Afficher le nom du fournisseur, le numéro de commande et la date)

	SELECT numcom, nomfou, datcom
	FROM entcom
	JOIN fournis ON fournis.numfou = entcom.numfou


-- 11. Sortir les produits des commandes ayant le mot "urgent' en observation? (Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et le sous total = quantité commandée * Prix unitaire)

	SELECT produit.codart, produit.libart
	FROM produit
        INNER JOIN ligcom ON produit.codart = ligcom.codart
        INNER JOIN entcom ON ligcom.numcom = entcom.numcom
	WHERE entcom.obscom LIKE '%urgent%';


-- 12. Coder de 2 manières différentes la requête suivante : Lister le nom des fournisseurs susceptibles de livrer au moins un article

	SELECT nomfou, COUNT(codart) AS 'code art'
	FROM fournis
	JOIN vente ON vente.numfou = fournis.numfou
	GROUP BY fournis.numfou


-- 13. Coder de 2 manières différentes la requête suivante Lister les commandes (Numéro et date) dont le fournisseur est celui de la commande 70210 :

	SELECT numcom, datcom
	FROM entcom
	WHERE numcom = '70210'
	GROUP BY numfou


-- 14. Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés sur Prix1) que le moins cher des rubans (article dont le premier caractère commence par R). On affichera le libellé de l’article et prix1

	SELECT libart, prix1
	FROM vente
	JOIN produit ON produit.codart = vente.codart
	WHERE libart LIKE 'R%'


-- 15. Editer la liste des fournisseurs susceptibles de livrer les produits dont le stock est inférieur ou égal à 150 % du stock d'alerte. La liste est triée par produit puis fournisseur

	SELECT produit.codart, fournis.numfou, nomfou 
	FROM fournis
	JOIN vente ON vente.numfou = fournis.numfou
	JOIN produit ON produit.codart = vente.codart
	WHERE  stkphy  <= (stkale * 150 / 100)
	ORDER BY produit.codart, fournis.numfou


-- 16. Éditer la liste des fournisseurs susceptibles de livrer les produit dont le stock est inférieur ou égal à 150 % du stock d'alerte et un délai de livraison d'au plus 30 jours. La liste est triée par fournisseur puis produit

	SELECT produit.codart, fournis.numfou, nomfou 
	FROM fournis
	JOIN vente ON vente.numfou = fournis.numfou
	JOIN produit ON produit.codart = vente.codart
	WHERE  stkphy  <= (stkale * 150 / 100) and vente.delliv < 31
	ORDER BY produit.codart, fournis.numfou


-- 17. Avec le même type de sélection que ci-dessus, sortir un total des stocks par fournisseur trié par total décroissant

	SELECT fournis.numfou, vente.codart, nomfou, sum(stkphy) AS 'total stocks'
	FROM fournis
	JOIN vente ON vente.numfou = fournis.numfou
	JOIN produit ON produit.codart = vente.codart
	WHERE vente.delliv  < 31 and  stkphy  <= (stkale * 150 / 100)
	GROUP BY fournis.numfou, vente.codart, nomfou
	ORDER BY sum(stkphy) desc


-- 18. En fin d'année, sortir la liste des produits dont la quantité réellement commandée dépasse 90% de la quantité annuelle prévue.

	SELECT ligcom.codart, SUM(qtecde)
	FROM ligcom
	JOIN produit ON produit.codart = ligcom.codart
	WHERE qtecde >= (qteann * 90 / 100)
	GROUP BY codart



-- 19. Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant que les prix indiqués sont hors taxes et que le taux de TVA est 20%.

	SELECT fournis.numfou, nomfou, SUM(qtecde * priuni * 1.2)   
	FROM fournis
	JOIN entcom ON entcom.numfou = fournis.numfou
	JOIN ligcom ON ligcom.numcom = entcom.numcom
	WHERE YEAR (datcom) = '2018'
	GROUP BY fournis.numfou, nomfou
