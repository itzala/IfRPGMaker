SOURCE ./create/histoire/all_tables.sql

CREATE TABLE IF NOT EXISTS `dialogues`
(
	auteur varchar(40) NOT NULL,
	description varchar(40),
	perso int(11) NOT NULL,
	contrainte int(11) NOT NULL,
	dialogues text NOT NULL,

	PRIMARY KEY (auteur, description, perso)
	FOREIGN KEY (auteur) REFERENCES Joueur(pseudo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (perso) REFERENCES Perso(nom) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element) ON DELETE CASCADE ON UPDATE CASCADE,

) ENGINE = INNODB;