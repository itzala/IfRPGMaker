SOURCE ./create/histoire/all_tables.sql

CREATE TABLE IF NOT EXISTS `dialogues`
(
	auteur varchar(40),
	titre varchar(40),
	date_creation date,
	date_modification date,
	histoire varchar(40) NOT NULL,
	type int(11) NOT NULL,
);