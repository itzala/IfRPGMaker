# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On supprime toutes les tables

TRUNCATE TABLE `PartieCorps`;
TRUNCATE TABLE `Metier`;
TRUNCATE TABLE `Classe`;
TRUNCATE TABLE `Race`;

# On résactive les contraintes de clés étrangères
SET foreign_key_checks = 1;