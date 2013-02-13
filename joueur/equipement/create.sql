CREATE TABLE IF NOT EXISTS `TypeObjet`
(
	nom varchar(40) PRIMARY KEY,
	partie_corps varchar(40) NOT NULL,

	FOREIGN KEY (partie_corps) REFERENCES PartieCorps(nom)
);

CREATE TABLE IF NOT EXISTS `Objet`
(
	nom varchar(40) PRIMARY KEY,
	type varchar(40) NOT NULL,
	poids int(3) NOT NULL,
	encombrement int(3) NOT NULL,

	FOREIGN KEY (type) REFERENCES TypeObjet(nom)
	CONSTRAINT poids CHECK (poids > 0),
	CONSTRAINT encombrement CHECK (encombrement > 0)
);

CREATE TABLE IF NOT EXISTS `Equipement`
(
	id_perso int(11) NOT NULL,
	objet int(11) NOT NULL,

	PRIMARY KEY id_equipement (id_perso, objet)
	FOREIGN KEY (id_perso) REFERENCES Personnage(nom),
	FOREIGN KEY (objet) REFERENCES Objet(nom),
);