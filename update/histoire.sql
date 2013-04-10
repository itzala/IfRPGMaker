UPDATE Intro SET contenu="%PARAM_CONTENU%" WHERE id=%PARAM_ID%;
UPDATE Description SET contenu="%PARAM_CONTENU%" WHERE id=%PARAM_ID%;

UPDATE Evenement SET intro=%PARAM_INTRO%, description=%PARAM_DESCRIPTION% WHERE intro=%PARAM_INTRO% AND description=%PARAM_DESCRIPTION%;


UPDATE Choix SET intro=%PARAM_INTRO%, description=%PARAM_DESCRIPTION%, parent=%PARAM_PARENT% WHERE id=%PARAM_ID%;


UPDATE Scenario SET auteur="%PARAM_AUTEUR%", titre="%PARAM_TITRE%", debut=%PARAM_DEBUT% WHERE auteur="%PARAM_AUTEUR%" AND titre="%PARAM_TITRE%" AND debut=%PARAM_DEBUT%;


UPDATE Histoire SET auteur="%PARAM_AUTEUR%", titre="%PARAM_TITRE%" WHERE auteur="%PARAM_AUTEUR%" AND titre="%PARAM_TITRE%";
