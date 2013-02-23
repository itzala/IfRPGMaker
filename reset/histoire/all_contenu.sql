# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On vide toutes les tables

TRUNCATE IF EXISTS `Description`;
TRUNCATE IF EXISTS `Intro`;
TRUNCATE IF EXISTS `Evenement`;
TRUNCATE IF EXISTS `Histoire`;
TRUNCATE IF EXISTS `Choix`;
TRUNCATE IF EXISTS `Scenario`;

# On résactive les contraintes de clés étrangères
SET foreign_key_checks = 1;