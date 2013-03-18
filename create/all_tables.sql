CREATE TABLE IF NOT EXISTS `ElementContrainte`
(
	id_element int(11) PRIMARY KEY

) ENGINE = INNODB;

SOURCE ./create/joueur/all_tables.sql;
SOURCE ./create/systeme_jeu/all_tables.sql;
SOURCE ./create/histoire/all_tables.sql;
SOURCE ./create/personnage/all_tables.sql;
#SOURCE ./create/actions/all_tables.sql;
#SOURCE ./create/dialogues/all_tables.sql;
SOURCE ./create/contrainte/all_tables.sql;
#SOURCE ./create/config/all_tables.sql;
