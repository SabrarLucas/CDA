-- 1 - modif_reservation : interdire la modification des réservations (on autorise l'ajout et la suppression).

DELIMITER //

CREATE TRIGGER modif_reservation
BEFORE UPDATE ON reservation
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Modification des réservations interdite. Seules les insertions et les suppressions sont autorisées.';
END;

//

DELIMITER ;


-- 2 - insert_reservation : interdire l'ajout de réservation pour les hôtels possédant déjà 10 réservations.

DELIMITER //

CREATE TRIGGER insert_reservation
BEFORE INSERT ON reservation
FOR EACH ROW
BEGIN
    DECLARE hotel_reservation_count INT;
    SELECT COUNT(*) INTO hotel_reservation_count FROM reservation WHERE res_cha_id = NEW.res_cha_id;
    
    IF hotel_reservation_count >= 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L\'hôtel a déjà 10 réservations, l\'ajout de réservation est interdit.';
    END IF;
END;

//

DELIMITER ;


-- 3 - insert_reservation2 : interdire les réservations si le client possède déjà 3 réservations.

DELIMITER //

CREATE TRIGGER insert_reservation2
BEFORE INSERT ON reservation
FOR EACH ROW
BEGIN
    DECLARE client_reservation_count INT;
    SELECT COUNT(*) INTO client_reservation_count FROM reservation WHERE res_cli_id = NEW.res_cli_id;
    
    IF client_reservation_count >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Le client a déjà 3 réservations, l\'ajout de réservation est interdit.';
    END IF;
END;

//

DELIMITER ;


-- 4 - insert_chambre : lors d'une insertion, on calcule le total des capacités des chambres pour l'hôtel, si ce total est supérieur à 50, on interdit l'insertion de la chambre.

DELIMITER //

CREATE TRIGGER insert_chambre
BEFORE INSERT ON chambre
FOR EACH ROW
BEGIN
    DECLARE total_capacity INT;
    SELECT SUM(cha_capacite) INTO total_capacity FROM chambre WHERE cha_hot_id = NEW.cha_hot_id;
    
    IF total_capacity + NEW.cha_capacite > 50 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L\'ajout de la chambre est interdit car le total des capacités dépasse 50.';
    END IF;
END;

//

DELIMITER ;
