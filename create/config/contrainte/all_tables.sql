CREATE TABLE IF NOT EXISTS `Contrainte`
(
	auteur varchar(40) NOT NULL,
	titre varchar(40) NOT NULL,
	pseudo varchar(40),
	id_contrainte int(11) PRIMARY KEY,

	FOREIGN KEY (auteur, titre) REFERENCES Histoire(auteur, titre) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (pseudo) REFERENCES Joueur(pseudo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `ObjetContrainte`
(
	id_objet int(11) PRIMARY KEY,
	id_contrainte int(11),

	FOREIGN KEY (id_contrainte) REFERENCES Contrainte(id_contrainte) ON DELETE CASCADE ON UPDATE CASCADE,
);