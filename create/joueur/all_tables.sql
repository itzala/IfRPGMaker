# Ordre de création
# Etape 1
#	PartieCorps, Race, Métier, Joueur, TypeCaract, TypeXp, 
# Etape 2
#	TypeObjet, CorpsRace, MetierRace, Caractéristiques, Personnage, Xp, 
# Etape 3
#	Objet, Compétences, Save, CaractPerso, CaractRace
# Etape 4
#	Equipement


SOURCE ./all_tables/joueur/personnage/all_tables.sql;
SOURCE ./all_tables/joueur/equipement/all_tables.sql;
SOURCE ./all_tables/joueur/savoir/all_tables.sql;
SOURCE ./all_tables/joueur/capacite/all_tables.sql;
SOURCE ./all_tables/joueur/all_tables.sql;
CREATE TABLE IF NOT EXISTS `Joueur`
(
	pseudo varchar(40) PRIMARY KEY,
	mdp varchar(40) NOT NULL
);