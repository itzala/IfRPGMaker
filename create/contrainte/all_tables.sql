CREATE TABLE IF NOT EXISTS `Contrainte`
(
	id_contrainte int(11) PRIMARY KEY,
	auteur varchar(40),
	titre varchar(40),
	nom_perso varchar(40), 

	FOREIGN KEY (auteur, titre) REFERENCES Histoire(auteur, titre) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (nom_perso) REFERENCES Personnage(nom_perso) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;




ALTER TABLE `ElementContrainte` ADD id_contrainte int(11);

ALTER TABLE `ElementContrainte` ADD CONSTRAINT fk_contrainte_id FOREIGN KEY (id_contrainte) references Contrainte(id_contrainte);