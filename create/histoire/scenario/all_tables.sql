CREATE TABLE IF NOT EXISTS `Scenario`
(
	debut int(11) NOT NULL,
	
	auteur varchar(40) NOT NULL,
	titre varchar(40) NOT NULL,

	FOREIGN KEY (debut) REFERENCES Choix(id),
	FOREIGN KEY (auteur, titre) REFERENCES Histoire(auteur, titre),
	PRIMARY KEY (debut, auteur, titre)
);
