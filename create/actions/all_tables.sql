CREATE TABLE IF NOT EXISTS `Embrayage`
(
	keyword varchar(40) NOT NULL,
	action varchar(40) NOT NULL,

	PRIMARY KEY (keyword, actiontext);
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Actions`
(
	action varchar(40) PRIMARY KEY,

) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Dictionnaire`
(
	keyword varchar(40) NOT NULL,
	synonym varchar(40) NOT NULL,

	PRIMARY KEY (keyword, synonym);
) ENGINE = INNODB;

SOURCE ./all_contenu.sql;