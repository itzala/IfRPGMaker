CREATE TABLE IF NOT EXISTS `Scenario`
(
	debut int(11) NOT NULL,
	
	auteur varchar(40) NOT NULL,
	titre varchar(40) NOT NULL,

	contrainte int(11),

	PRIMARY KEY (debut, auteur, titre)
	
	FOREIGN KEY (debut) REFERENCES Choix(id),
	FOREIGN KEY (auteur, titre) REFERENCES Histoire(auteur, titre),
	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element) ON DELETE CASCADE ON UPDATE CASCADE,
);
