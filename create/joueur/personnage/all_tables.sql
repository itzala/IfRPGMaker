CREATE TABLE IF NOT EXISTS `PartieCorps`
(
	nom varchar(40) PRIMARY KEY,	
	taille ENUM('Petite', 'Moyenne', 'Grande')
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS `Race`
(
	nom varchar(40) PRIMARY KEY	
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Metier`
(
	intitule varchar(40) PRIMARY KEY
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Classe`
(
	nom varchar(40) PRIMARY KEY
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Personnage`
(	
	nom varchar(40) PRIMARY KEY,
	race varchar(40) NOT NULL,
	metier varchar(40),
	classe varchar(40) NOT NULL,
	taille ENUM('Petite', 'Moyenne', 'Grande'),
	
	FOREIGN KEY (metier) REFERENCES Metier(intitule) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (classe) REFERENCES Classe(nom) ON DELETE CASCADE ON UPDATE CASCADE,	
	FOREIGN KEY (race) REFERENCES Race(nom) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;