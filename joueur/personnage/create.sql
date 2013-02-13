CREATE TABLE IF NOT EXISTS `PartieCorps`
(
	nom varchar(40) PRIMARY KEY,	
	taille ENUM('Petite', 'Moyenne', 'Grande')
);


CREATE TABLE IF NOT EXISTS `Race`
(
	nom varchar(40) PRIMARY KEY	
);

CREATE TABLE IF NOT EXISTS `CorpsRace`
(
	race varchar(40) NOT NULL,
	partie varchar(40) NOT NULL,

	PRIMARY KEY (race, partie),
	FOREIGN KEY (race) REFERENCES Race(nom),
	FOREIGN KEY (partie) REFERENCES PartieCorps(nom)
);

CREATE TABLE IF NOT EXISTS `Personnage`
(	
	nom varchar(40) PRIMARY KEY,
	race varchar(40),
	taille ENUM('Petite', 'Moyenne', 'Grande')
);