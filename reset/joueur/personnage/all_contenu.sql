# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On supprime toutes les tables

TRUNCATE TABLE `Classe`;
TRUNCATE TABLE `Metier`;
TRUNCATE TABLE `PartieCorps`;
TRUNCATE TABLE `Race`;
TRUNCATE TABLE `Joueur`;
TRUNCATE TABLE `Personnage`;


# On réactive les contraintes de clés étrangères
SET foreign_key_checks = 1;