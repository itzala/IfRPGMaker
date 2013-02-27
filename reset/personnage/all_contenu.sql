# On désactive les contraintes de clés étrangères
SET foreign_key_checks = 0;

# On supprime toutes les tables

TRUNCATE TABLE `Personnage`;
TRUNCATE TABLE `CaractPersoHistoire`;
TRUNCATE TABLE `EquipementPersoHistoire`;

# On résactive les contraintes de clés étrangères
SET foreign_key_checks = 1;