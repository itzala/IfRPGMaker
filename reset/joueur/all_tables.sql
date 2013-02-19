# On désactive les contraintes de clés étrangères  => inutile sur le serveur de la fac !!
#set foreign_key_checks 0;

# On supprime toutes les tables

DROP TABLE IF EXISTS `Classe`;
DROP TABLE IF EXISTS `ClasseRace`;
DROP TABLE IF EXISTS `MetierRace`;
DROP TABLE IF EXISTS `Metier`;
DROP TABLE IF EXISTS `PartieCorps`;
DROP TABLE IF EXISTS `MetierClasse`;
DROP TABLE IF EXISTS `CorpsRace`;
DROP TABLE IF EXISTS `Race`;
DROP TABLE IF EXISTS `Objet`;
DROP TABLE IF EXISTS `Equipement`;
DROP TABLE IF EXISTS `TypeObjet`;
DROP TABLE IF EXISTS `Joueur`;
DROP TABLE IF EXISTS `Personnage`;

# On résactive les contraintes de clés étrangères
#set foreign_key_checks 1;