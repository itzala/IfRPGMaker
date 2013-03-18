CREATE TABLE IF NOT EXISTS `PartieCorps`
(
	nom varchar(40) PRIMARY KEY,	
	taille ENUM('Petite', 'Moyenne', 'Grande'),
	id_systeme_jeu int(11) NOT NULL,

	FOREIGN KEY (id_systeme_jeu) REFERENCES SystemeJeu(id)

) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS `Race`
(
	nom varchar(40) PRIMARY KEY,
	id_systeme_jeu int(11) NOT NULL,

	FOREIGN KEY (id_systeme_jeu) REFERENCES SystemeJeu(id)

) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Metier`
(
	intitule varchar(40) PRIMARY KEY,
	id_systeme_jeu int(11) NOT NULL,

	FOREIGN KEY (id_systeme_jeu) REFERENCES SystemeJeu(id)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Classe`
(
	nom varchar(40) PRIMARY KEY,
	id_systeme_jeu int(11) NOT NULL,

	FOREIGN KEY (id_systeme_jeu) REFERENCES SystemeJeu(id)
) ENGINE = INNODB;