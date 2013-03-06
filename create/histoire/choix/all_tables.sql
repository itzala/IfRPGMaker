CREATE TABLE IF NOT EXISTS `Choix`
(
	id int(11) PRIMARY KEY AUTO_INCREMENT, 

	intro int(11) NOT NULL,
	description int(11) NOT NULL,

	choix_parent int(11),
	
	auteur varchar(40) NOT NULL,
	titre varchar(40) NOT NULL,

	FOREIGN KEY (choix_parent) REFERENCES Choix(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (intro, description) REFERENCES Evenement(intro, description) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (auteur, titre) REFERENCES Histoire(auteur, titre)
) ENGINE = INNODB;