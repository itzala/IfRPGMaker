CREATE TABLE IF NOT EXISTS `SystemeJeu`
(
	id int(11) PRIMARY KEY,
	createur varchar(40) NOT NULL,

	FOREIGN KEY (createur) REFERENCES Joueur(pseudo)

) ENGINE = INNODB;

SOURCE ./create/systeme_jeu/caracteristique/all_tables.sql;
SOURCE ./create/systeme_jeu/race/all_tables.sql;
SOURCE ./create/systeme_jeu/equipement/all_tables.sql;