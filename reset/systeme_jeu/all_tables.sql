SOURCE ./reset/systeme_jeu/caracteristique/all_tables.sql
SOURCE ./reset/systeme_jeu/equipement/all_tables.sql
SOURCE ./reset/systeme_jeu/race/all_tables.sql

SET foreign_key_checks = 0;

# On supprime toutes les tables

DROP TABLE IF EXISTS `SystemeJeu`;

# On résactive les contraintes de clés étrangères
SET foreign_key_checks = 1;