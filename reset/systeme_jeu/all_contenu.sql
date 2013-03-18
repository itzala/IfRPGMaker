SOURCE ./reset/systeme_jeu/caracteristique/all_contenu.sql
SOURCE ./reset/systeme_jeu/equipement/all_contenu.sql
SOURCE ./reset/systeme_jeu/race/all_contenu.sql

SET foreign_key_checks = 0;

# On supprime toutes les tables

TRUNCATE TABLE `SystemeJeu`;

# On résactive les contraintes de clés étrangères
SET foreign_key_checks = 1;