# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On supprime toutes les tables

DROP TABLE IF EXISTS `Caracteristique`;
DROP TABLE IF EXISTS `CaractPerso`;

# On réactive les contraintes de clés étrangères
SET foreign_key_checks = 1;