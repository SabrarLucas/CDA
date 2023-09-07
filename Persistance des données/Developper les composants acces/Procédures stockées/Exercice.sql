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
