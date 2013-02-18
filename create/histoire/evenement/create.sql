CREATE TABLE IF NOT EXISTS `Description`
(
	id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	contenu text NOT NULL
);

CREATE TABLE IF NOT EXISTS `Evenement`
(
	intro varchar(255)NOT NULL,
	description int(11)NOT NULL,


	PRIMARY KEY id_event (intro, description),
	FOREIGN KEY (description) REFERENCES Description(id) ON DELETE CASCADE ON UPDATE CASCADE
);