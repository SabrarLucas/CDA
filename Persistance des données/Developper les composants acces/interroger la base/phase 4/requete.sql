-- 1. Application d'une augmentation de tarif de 4% pour le prix 1 et de 2% pour le prix2 pour le fournisseur 9180

	UPDATE vente
	SET prix1 = prix1 * 1.04,
	    prix2 = prix2 * 1.02
	WHERE numfou = 9180
	
-- 2. Dans la table vente, mettre à jour le prix2 des articles dont le prix2 est null, en affectant a prix2 la valeur de prix1

	UPDATE vente
	SET prix2 = prix1
	WHERE prix2 = 0


-- 3. Mettre à jour le champ obscom en positionnant '*****' pour toutes les commandes dont le fournisseur a un indice de satisfaction <5

	UPDATE entcom
	SET obscom = '*****'
	JOIN fournis ON fournis.numfou = entcom.numfou
	WHERE satisf < 5


-- 4. Suppression du produit I110

	DELETE FROM produit
	WHERE codart = 'I110'
