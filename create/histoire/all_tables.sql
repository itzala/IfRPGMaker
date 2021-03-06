SOURCE ./create/histoire/evenement/all_tables.sql


CREATE TABLE IF NOT EXISTS `Histoire`
(
	auteur varchar(40) NOT NULL,
	titre varchar(40),

	date_creation date,
	date_modification date,
	
	description int(11),

	contrainte int(11),

	PRIMARY KEY (auteur, titre),
	FOREIGN KEY (auteur) REFERENCES Joueur(pseudo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (description) REFERENCES Description(id) ON DELETE CASCADE ON UPDATE CASCADE
	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element) ON DELETE CASCADE ON UPDATE CASCADE,
) ENGINE = INNODB;

SOURCE ./create/histoire/choix/all_tables.sql
SOURCE ./create/histoire/scenario/all_tables.sql