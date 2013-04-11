UPDATE SystemeJeu SET createur="%PARAM_CREATEUR%" WHERE id=%PARAM_ID%;

UPDATE PartieCorps SET nom="%PARAM_NOM%", taille=%PARAM_TAILLE%, id_systeme_jeu=%PARAM_ID_SYST_JEU% WHERE nom="%PARAM_NOM%";

UPDATE Race SET nom="%PARAM_NOM%", id_systeme_jeu=%PARAM_ID_SYST_JEU% WHERE nom="%PARAM_NOM%"%;

UPDATE Metier SET intitule="%PARAM_INTITULE%", id_systeme_jeu=%PARAM_ID_SYST_JEU% WHERE intitule="%PARAM_INTITULE%";

UPDATE Classe SET nom="%PARAM_NOM%", id_systeme_jeu=%PARAM_ID_SYST_JEU% WHERE nom="%PARAM_NOM%"%;

UPDATE TypeObjet SET nom="%PARAM_NOM%", partie_corps=%PARAM_PARTIE_CORPS% WHERE nom="%PARAM_NOM%"%;

UPDATE Objet SET nom="%PARAM_NOM%", type="%PARAM_TYPE%", poids=%PARAM_POIDS%, encombrement=%PARAM_ENCOMBREMENT%, id_systeme_jeu=%PARAM_ID_SYST_JEU% WHERE nom="%PARAM_NOM%"%;

UPDATE Caracteristique SET nom="%PARAM_NOM%", id_systeme_jeu=%PARAM_ID_SYST_JEU% WHERE nom="%PARAM_NOM%"%;

