SET foreign_key_checks = 0;

LOAD DATA LOCAL INFILE './fixtures/joueur/capacite/caract.txt' INTO TABLE `Caracteristique` FIELDS TERMINATED BY ',' ENCLOSED BY '';
LOAD DATA LOCAL INFILE './fixtures/joueur/capacite/caract_perso.txt' INTO TABLE `CaractPerso`  FIELDS TERMINATED BY ',' ENCLOSED BY '';

SET foreign_key_checks = 1;