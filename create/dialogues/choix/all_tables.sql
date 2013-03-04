CREATE TABLE IF NOT EXISTS `Choix`
(
	id int(11) PRIMARY KEY AUTO_INCREMENT,
	histoire varchar(40) NOT NULL,
	choix_perso int(11) NOT NULL,
	type_perso int(11) NOT NULL,
	dialogues text NOT NULL,

	FOREIGN KEY (histoire) REFERENCES histoire(titre) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (choix_perso) REFERENCES Choix(id) ON DELETE CASCADE ON UPDATE CASCADE,
);