CREATE TABLE IF NOT EXISTS `Caracteristique`
(
	nom varchar(40) PRIMARY KEY,
	id_systeme_jeu int(11) NOT NULL,

	FOREIGN KEY (id_systeme_jeu) REFERENCES SystemeJeu(id)

) ENGINE = INNODB;