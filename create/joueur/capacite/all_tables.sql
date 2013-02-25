CREATE TABLE IF NOT EXISTS `Caracteristique`
(
	nom varchar(40) PRIMARY KEY

) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `CaractPerso`
(
	caract varchar(40),
	perso varchar(40),
	valeur int(11),

	PRIMARY KEY (caract, perso, valeur),
	FOREIGN KEY (caract) REFERENCES Caracteristique(nom),
	FOREIGN KEY (perso) REFERENCES Personnage(nom),
	CONSTRAINT valeur CHECK (valeur > 0)

) ENGINE = INNODB;