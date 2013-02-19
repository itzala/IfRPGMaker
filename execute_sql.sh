#!/bin/bash

# variables globales xD

DEFAULT="A REMPLACER PAR VOTRE CONFIGURATION LOCALE"
PATH_CONFIG="config.sh"
MSG_ERROR_MYSQL="Connexion au serveur mysql impossible. \nVeuillez vérifier les informations contenue dans ${PATH_CONFIG}"
EXEC="./execute_sql.sh"
MYSQL_EXEC=""

# fonctions internes mais très utiles ;)

write_config()
{
	echo 'DBNAME="'$1'"
USERNAME="'$2'"
USERPASS="'$3'"
EDITOR_USER="'$4'"
HOST="'$5'"
' > ${PATH_CONFIG};
chmod 600 ${PATH_CONFIG};
}

create_config()
{

	echo "Merci de répondre aux quatres questions suivantes : ";
	read -p "Le nom de la base : " dbname;
	read -p "Votre nom d'utilisateur : " username;
	echo -n "Votre mot de passe : "
	read -s  userpass;	
	read -p "
Le nom de votre serveur de données : " host;
	read -p "L'éditeur à utiliser pour éditer les fichiers : " editeur;
	write_config $dbname $username $userpass $editeur $host;
}

usage()
{
	echo $1;
	exit;
}

help_prog()
{
	echo -n "
Bienvenue dans l'aide.
Ce programme a été écrit pour vous éviter de vous souvenir quelle est l'arborescence des fichiers du projet.
[Usage] : $EXEC [Action] [Chemin du thème] [Cible de l'action]

Action :
	";
	ls --ignore=*.*;
	echo -n "
Chemin du thème :
	";
	ls --ignore=*.* ./create; 
	echo "
Cible :
	contenu  tables";
}

create_theme()
{
	if [ -d $1 ]
	then
		if [ ! -d $1"/"$2  ]
		then
			echo -n "Création du thème '$2' pour l'action '$1'......";
			mkdir -p $1"/"$2;
			echo " Done";
		else
			usage "Le thème '$2' pour l'action '$1' existe déjà.";
		fi
	else
		usage "L'action '$1' n'existe pas et vous ne pouvez pas en créer de nouvelles. Faites $EXEC pour obtenir
		la liste des actions reconnues";
	fi
}

exec_sql()
{
	if [ -d ./$1 ]
	then
		chemin="./$1/$2";
		if [ -d $chemin ]
		then			
			fic="$chemin/all_$3.sql";
			if [ -f $fic ]
			then
				echo -n "Exécution de la commande........ ";
				$MYSQL_EXEC < $fic
				echo " Done";
			else
				usage "Pour le thème '$2' de l'action '$1', une modification de '$fic' n'est pas possible";
			fi
		else
			usage "Thème inconnu. Faite $EXEC help pour obtenir la liste des thèmes reconnus";
		fi
	else
		usage "Action inconnue. Faite $EXEC help pour obtenir la liste des actions reconnues";
	fi
}

modifier_config()
{
	${EDITOR_USER} ${PATH_CONFIG} ;
}

# fonction main :)
clear;
if [ ! -f ${PATH_CONFIG} ]
then
	echo -n "Le programme a besoin d'un fichier de configuration qu'il ne peut trouver dans "; 
	pwd;
	create_config ;
	ls -l ${PATH_CONFIG};	
fi
clear;
source ${PATH_CONFIG}
echo "La config a bien été récupérée! ";	
MYSQL_EXEC="mysql -h $HOST -u $USERNAME -p$USERPASS $DBNAME ";
case $# in
	0)			
		usage "[Usage] : $EXEC nécessite au moins un argument pour afficher l'aide et au moins deux arguments pour fonctionner";
		;;
	1)
		case $1 in
			"help")
				help_prog;
			;;
			"config")
				echo "Modifier votre configuration et relancer le programme";
				modifier_config;
			;;			
			*)
				usage "[Usage] : $EXEC help pour afficher l'aide ou $EXEC config pour modifier votre configuration";
			;;
		esac			
		;;
	2)
		echo "Vous avez souhaité créer le thème '$2' pour l'action '$1'";
		create_theme $1 $2
		;;
	3)
		case $3 in
			"contenu")
				exec_sql $1 $2 $3;				
			;;
			"tables")
				exec_sql $1 $2 $3;
			;;
			"all")
				exec_sql $1 $2 $3;
			;;
			*)
				usage "Vous devez choisir d'agir sur le contenu ou sur les tables";
			;;
		esac
		;;
	*)
		usage "Vous avez été flashé à '$#' arguments alors que la limite est de 3 arguments";
		;;
esac