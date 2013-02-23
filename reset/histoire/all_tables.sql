# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On supprime toutes les tables
DROP TABLE IF EXISTS `Description`;
DROP TABLE IF EXISTS `Intro`;
DROP TABLE IF EXISTS `Evenement`;
DROP TABLE IF EXISTS `Histoire`;
DROP TABLE IF EXISTS `Choix`;
DROP TABLE IF EXISTS `Scenario`;

# On réactive les contraintes de clés étrangères
SET foreign_key_checks = 1;