CREATE TABLE IF NOT EXISTS `Contrainte`
(
	id_contrainte int(11) PRIMARY KEY,
	auteur varchar(40),
	titre varchar(40),
	nom_perso varchar(40),

	FOREIGN KEY (auteur, titre) REFERENCES Histoire(auteur, titre),
	FOREIGN KEY (nom_perso) REFERENCES Personnage(pseudo)
) ENGINE = INNODB;




ALTER TABLE `ElementContrainte` ADD contrainte int(11);

ALTER TABLE `ElementContrainte` ADD CONSTRAINT fk_contrainte_id FOREIGN KEY ElementContrainte(contrainte) references Contrainte(id_contrainte);