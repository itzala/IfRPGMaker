# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On supprime toutes les tables

DROP TABLE IF EXISTS `PartieCorps`;
DROP TABLE IF EXISTS `Metier`;
DROP TABLE IF EXISTS `Classe`;
DROP TABLE IF EXISTS `Race`;

# On résactive les contraintes de clés étrangères
SET foreign_key_checks = 1;