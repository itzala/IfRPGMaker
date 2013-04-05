CREATE TABLE IF NOT EXISTS `Choix`
(
	id int(11) PRIMARY KEY AUTO_INCREMENT, 

	intro int(11) NOT NULL,
	description int(11) NOT NULL,.

	choix_parent int(11),
	
	contrainte int(11),


	FOREIGN KEY (choix_parent) REFERENCES Choix(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (intro) REFERENCES Intro(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (description) REFERENCES Description(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element)
	
) ENGINE = INNODB;