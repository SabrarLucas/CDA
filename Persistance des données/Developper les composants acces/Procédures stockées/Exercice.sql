-- EX 1 --

DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
	SELECT entcom.numfou
	FROM entcom
	GROUP BY numfou
END |

/* On rétablit le délimiteur initial */
DELIMITER ;

CALL Lst_fournis;



localhost:3306/papyrus/		http://127.0.0.1/phpmyadmin/index.php?route=/database/sql&db=papyrus
La requête SQL a été exécutée avec succès.

SHOW CREATE PROCEDURE Lst_fournis;



Lst_fournis	STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_...	CREATE DEFINER=`admin`@`localhost` PROCEDURE `Lst_fournis`	utf8mb4	utf8mb4_unicode_ci	utf8mb4_general_ci	



-- EX 2 --

/* On modifie le délimiteur initial ; en le remplacant par | */
DELIMITER |

CREATE PROCEDURE Lst_Commandes()
BEGIN
	SELECT produit.codart, produit.libart
	FROM produit
        INNER JOIN ligcom ON produit.codart = ligcom.codart
        INNER JOIN entcom ON ligcom.numcom = entcom.numcom
	WHERE entcom.obscom LIKE '%urgent%';
END |

/* On rétablit le délimiteur initial */
DELIMITER ;

CALL Lst_Commandes;



localhost:3306/papyrus/		http://127.0.0.1/phpmyadmin/index.php?route=/database/sql&db=papyrus
La requête SQL a été exécutée avec succès.

SHOW CREATE PROCEDURE Lst_Commandes;



Lst_Commandes	STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_...	CREATE DEFINER=`admin`@`localhost` PROCEDURE `Lst_Commandes`	utf8mb4	utf8mb4_unicode_ci	utf8mb4_general_ci	



-- EX 3 --

DELIMITER |

CREATE PROCEDURE CA_Fournisseur(
    In numfou varchar (25), 
    In annee date(10)
)

BEGIN
	SELECT fournis.numfou, fournis.nomfou, SUM(ligcom.qtecde * ligcom.priuni * 1.2)   
	FROM fournis
	JOIN entcom ON entcom.numfou = fournis.numfou
	JOIN ligcom ON ligcom.numcom = entcom.numcom
	WHERE YEAR (datcom) = annee AND fournis.numfou = numfou
	GROUP BY fournis.numfou, nomfou;
END |

DELIMITER ;

CALL CA_Fournisseur('120', '2018');



localhost:3306/papyrus/		http://127.0.0.1/phpmyadmin/index.php?route=/database/sql&db=papyrus
La requête SQL a été exécutée avec succès.

SHOW CREATE PROCEDURE CA_Fournisseur;



CA_Fournisseur	STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_...	CREATE DEFINER=`admin`@`localhost` PROCEDURE `CA_Fournisseur`	utf8mb4	utf8mb4_unicode_ci	utf8mb4_general_ci	
