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