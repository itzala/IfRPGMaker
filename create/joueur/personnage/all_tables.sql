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
	FOREIGN KEY (race) REFERENCES Race(nom) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (partie) REFERENCES PartieCorps(nom) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Metier`
(
	intitule varchar(40) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS `MetierRace`
(
	metier varchar(40) NOT NULL,
	race varchar(40) NOT NULL,
	PRIMARY KEY metier_race (race, metier),
	FOREIGN KEY (race) REFERENCES Race(nom) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (metier) REFERENCES Metier(intitule) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Classe`
(
	nom varchar(40) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS `MetierClasse`
(
	metier varchar(40) NOT NULL,
	classe varchar(40) NOT NULL,

	PRIMARY KEY metier_classe (metier, classe),
	FOREIGN KEY (metier) REFERENCES Metier(intitule) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (classe) REFERENCES Classe(nom) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `ClasseRace`
(
	classe varchar(40) NOT NULL,
	race varchar(40) NOT NULL,

	PRIMARY KEY classe_race (classe, race),
	FOREIGN KEY (race) REFERENCES Race(nom) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (classe) REFERENCES Classe(nom) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Personnage`
(	
	nom varchar(40) PRIMARY KEY,
	race varchar(40) NOT NULL,
	metier varchar(40),
	classe varchar(40) NOT NULL,
	taille ENUM('Petite', 'Moyenne', 'Grande'),
	
	FOREIGN KEY (metier, race) REFERENCES MetierRace(metier, race) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (metier, classe) REFERENCES MetierClasse(metier, classe) ON DELETE CASCADE ON UPDATE CASCADE,	
	FOREIGN KEY (race, classe) REFERENCES ClasseRace(classe, race) ON DELETE CASCADE ON UPDATE CASCADE
);