CREATE TABLE IF NOT EXISTS `Description`
(
	id int(11) PRIMARY KEY AUTO_INCREMENT,
	contenu text NOT NULL,
	contrainte int(11),

	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Intro`
(
	id int(11) PRIMARY KEY AUTO_INCREMENT,
	contenu varchar(140) NOT NULL,
	contrainte int(11),

	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Evenement`
(
	intro int(11) NOT NULL,
	description int(11) NOT NULL,
	contrainte int(11),

	PRIMARY KEY (intro, description),
	
	FOREIGN KEY (intro) REFERENCES Intro(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (description) REFERENCES Description(id) ON DELETE CASCADE ON UPDATE CASCADE
	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element) ON DELETE CASCADE ON UPDATE CASCADE,
) ENGINE = INNODB;