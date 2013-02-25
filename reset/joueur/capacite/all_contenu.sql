# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On supprime toutes les tables

TRUNCATE TABLE `Caracteristique`;
TRUNCATE TABLE `CaractPerso`;

# On réactive les contraintes de clés étrangères
SET foreign_key_checks = 1;