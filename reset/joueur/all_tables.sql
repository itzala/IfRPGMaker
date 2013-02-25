# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On supprime toutes les tables

DROP TABLE IF EXISTS `Classe`;
DROP TABLE IF EXISTS `Metier`;
DROP TABLE IF EXISTS `PartieCorps`;
DROP TABLE IF EXISTS `Caracteristique`;
DROP TABLE IF EXISTS `CaractPerso`;
DROP TABLE IF EXISTS `Race`;
DROP TABLE IF EXISTS `Objet`;
DROP TABLE IF EXISTS `Equipement`;
DROP TABLE IF EXISTS `TypeObjet`;
DROP TABLE IF EXISTS `Joueur`;
DROP TABLE IF EXISTS `Personnage`;

# On résactive les contraintes de clés étrangères
SET foreign_key_checks = 1;