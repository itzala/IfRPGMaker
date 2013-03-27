# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On supprime toutes les tables

DROP TABLE IF EXISTS `ElementContraite`;
DROP TABLE IF EXISTS `Contraite`;

# On résactive les contraintes de clés étrangères
SET foreign_key_checks = 1;