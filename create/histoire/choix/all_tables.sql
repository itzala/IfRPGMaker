CREATE TABLE IF NOT EXISTS `Choix`
(
	id int(11) PRIMARY KEY AUTO_INCREMENT, 

	intro int(11),
	description int(11) NOT NULL,.

	choix_parent int(11),
	
	contrainte int(11),


	FOREIGN KEY (choix_parent) REFERENCES Choix(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (intro,description) REFERENCES Evenement(intro, description) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element)
	
) ENGINE = INNODB;