CREATE TABLE IF NOT EXISTS `TypeObjet`
(
	nom varchar(40) PRIMARY KEY,
	partie_corps varchar(40),

	FOREIGN KEY (partie_corps) REFERENCES PartieCorps(nom) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Objet`
(
	nom varchar(40) PRIMARY KEY,
	type varchar(40),
	poids int(3),
	encombrement int(3),	
	id_systeme_jeu int(11) NOT NULL,

	FOREIGN KEY (id_systeme_jeu) REFERENCES SystemeJeu(id),
	FOREIGN KEY (type) REFERENCES TypeObjet(nom) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT poids CHECK (poids > 0),
	CONSTRAINT encombrement CHECK (encombrement > 0)
) ENGINE = INNODB;

