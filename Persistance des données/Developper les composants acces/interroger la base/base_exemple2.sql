-- 1. Calculer le nombre d'employés de chaque titre. 

	SELECT COUNT(titre), titre
	FROM employe
	GROUP BY titre
	

-- 2. Calculer la moyenne des salaires et leur somme, par région.

	SELECT AVG(salaire) AS salaire_moyen, SUM(salaire) AS salaire_total, noregion
	FROM employe
	JOIN dept ON nodept
	GROUP BY noregion
	
	
-- 3. Afficher les numéros des départements ayant au moins 3 employés.

	SELECT nodep, COUNT(*) AS nb_employe
	FROM employe
	GROUP BY nodep
	HAVING COUNT(*) >= 3
	
	
-- 4. Afficher les lettres qui sont l'initiale d'au moins trois employés.

	SELECT SUBSTRING(nom, 1, 1)
	FROM employe
	HAVING COUNT(*) >= 3
	
	
-- 5. Rechercher le salaire maximum et le salaire minimum parmi tous les salariés et l'écart entre les deux.

	SELECT MIN(salaire) AS salaire_min, MAX(salaire) AS salaire_max, (MAX(salaire) - MIN(salaire)) AS ecart
	FROM employe
	

-- 6. Rechercher le nombre de titres différents. 

	SELECT COUNT(DISTINCT(titre)), titre
	FROM employe
	
	
-- 7. Pour chaque titre, compter le nombre d'employés possédant ce titre. 

	SELECT titre, COUNT(noemp) AS nb_employe
	FROM employe
	GROUP BY titre
	
	
-- 8. Pour chaque nom de département, afficher le nom du département et le nombre d'employés.

	SELECT dept.nom, COUNT(noemp) AS nb_employe
	FROM dept
	JOIN employe ON nodep
	GROUP BY dept.nom
	
	
-- 9. Rechercher les titres et la moyenne des salaires par titre dont la moyenne est supérieure à la moyenne des salaires des Représentants.

	SELECT titre, AVG(salaire) AS moyenne_des_salaires
	FROM employe
	GROUP BY titre
	HAVING AVG(salaire) > (
		SELECT AVG(salaire)
		FROM employe
		WHERE titre = 'représentant'
	);
	
	
-- 10. Rechercher le nombre de salaires renseignés et le nombre de taux de commission renseignés.

	SELECT COUNT(salaire), COUNT(tauxcom)
	FROM employe
