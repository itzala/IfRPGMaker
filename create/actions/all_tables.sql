CREATE TABLE IF NOT EXISTS `ActiKey`
(
	keyword varchar(40) NOT NULL,
	action varchar(40) NOT NULL,

	PRIMARY KEY (keyword, actiontext);
	
	FOREIGN KEY keyword REFERENCES Keywords(keyword)ON DELETE CASCADE ON UPDATE CASCADE
	FOREIGN KEY action REFERENCES Actions(action) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Actions`
(
	action varchar(40) PRIMARY KEY,

) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Keywords`
(
	keyword varchar(40) PRIMARY KEY,

) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `Dictionnaire`
(
	keyword varchar(40) NOT NULL,
	synonym varchar(40) NOT NULL,

	FOREIGN KEY keyword REFERENCES Keywords(keyword)ON DELETE CASCADE ON UPDATE CASCADE
	PRIMARY KEY (synonym);
) ENGINE = INNODB;

SOURCE ./all_contenu.sql;