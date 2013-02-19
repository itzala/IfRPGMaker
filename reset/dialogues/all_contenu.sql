# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On vide toutes les tables

TRUNCATE TABLE `Classe`;
TRUNCATE TABLE `ClasseRace`;
TRUNCATE TABLE `MetierRace`;
TRUNCATE TABLE `Metier`;
TRUNCATE TABLE `PartieCorps`;
TRUNCATE TABLE `MetierClasse`;
TRUNCATE TABLE `CorpsRace`;
TRUNCATE TABLE `Race`;
TRUNCATE TABLE `Objet`;
TRUNCATE TABLE `Equipement`;
TRUNCATE TABLE `TypeObjet`;
TRUNCATE TABLE `Joueur`;
TRUNCATE TABLE `Personnage`;

# On résactive les contraintes de clés étrangères
SET foreign_key_checks = 1;