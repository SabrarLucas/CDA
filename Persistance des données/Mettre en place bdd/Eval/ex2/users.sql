CREATE USER 'util1'@'localhost' IDENTIFIED BY 'mdp';

GRANT ALL PRIVILEGES ON Papyrus.* TO 'util1'@'localhost';

CREATE USER 'util2'@'localhost' IDENTIFIED BY 'mdp';

GRANT SELECT ON Papyrus.* TO 'util2'@'localhost';

CREATE USER 'util3'@'localhost' IDENTIFIED BY 'mdp';

GRANT SELECT ON Papyrus.Fournis TO 'util3'@'localhost';
