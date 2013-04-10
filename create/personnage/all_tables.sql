CREATE TABLE IF NOT EXISTS `Personnage`
(	
	nom varchar(40) PRIMARY KEY,
	race varchar(40),
	metier varchar(40),
	classe varchar(40),
	pseudo varchar(40),
	taille ENUM('Petite', 'Moyenne', 'Grande'),
	
	FOREIGN KEY (metier) REFERENCES Metier(intitule) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (classe) REFERENCES Classe(nom) ON DELETE CASCADE ON UPDATE CASCADE,	
	FOREIGN KEY (pseudo) REFERENCES Joueur(pseudo) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (race) REFERENCES Race(nom) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS `CaractPersoHistoire`
(
	caract varchar(40),
	perso varchar(40),
	valeur int(11),
	auteur varchar(40),
	titre varchar(40),
	
	PRIMARY KEY (caract, perso),
	FOREIGN KEY (auteur, titre) REFERENCES Histoire(auteur, titre) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (caract) REFERENCES Caracteristique(nom) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (perso) REFERENCES Personnage(nom) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT valeur CHECK (valeur > 0)

) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `EquipementPersoHistoire`
(
	personnage varchar(40),
	objet varchar(40),
	auteur varchar(40),
	titre varchar(40),

	PRIMARY KEY id_equipement (personnage, objet),
	FOREIGN KEY (personnage) REFERENCES Personnage(nom) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (auteur, titre) REFERENCES Histoire(auteur, titre) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (objet) REFERENCES Objet(nom) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;