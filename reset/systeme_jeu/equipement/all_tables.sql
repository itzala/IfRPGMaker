# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On supprime toutes les tables

DROP TABLE IF EXISTS `Objet`;
DROP TABLE IF EXISTS `TypeObjet`;

# On résactive les contraintes de clés étrangères
SET foreign_key_checks = 1;