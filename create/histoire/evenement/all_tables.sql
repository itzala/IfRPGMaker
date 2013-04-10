CREATE TABLE IF NOT EXISTS `Description`
(
	id int(11) PRIMARY KEY AUTO_INCREMENT,
	contenu text NOT NULL,
	contrainte int(11),

	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Intro`
(
	id int(11) PRIMARY KEY AUTO_INCREMENT,
	contenu varchar(140) NOT NULL,
	contrainte int(11),

	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Evenement`
(
	intro int(11),
	description int(11) NOT NULL,

	PRIMARY KEY (intro, description),
	FOREIGN KEY (contrainte) REFERENCES ElementContrainte(id_element)
) ENGINE = INNODB;

