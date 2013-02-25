#!/bin/bash

# variables globales xD

DEFAULT="A REMPLACER PAR VOTRE CONFIGURATION LOCALE";
PATH_CONFIG="../config_ifrpgmaker.sh";
EXEC="./exec_sql.sh";
MYSQL_EXEC="";
ARBO=$(ls --ignore=*.* ./create);

# fonctions internes mais très utiles ;)

write_config()
{
	echo 'DBNAME="'$1'"
USERNAME="'$2'"
USERPASS="'$3'"
EDITOR_USER="'$4'"
HOST="'$5'"
' > ${PATH_CONFIG};
# pour des raisons de sécurité, on cache le fichier à toute personne qui n'est pas le propriétaire
chmod 600 ${PATH_CONFIG};
}

create_config()
{

	echo "Merci de répondre aux quatres questions suivantes : ";
	read -p "Le nom de la base : " dbname;
	read -p "Votre nom d'utilisateur : " username;
	echo -n "Votre mot de passe : "
	# on utilise l'option -s de read pour cacher la saisie du mot de passe
	read -s  userpass;						
	read -p "
Le nom de votre serveur de données : " host;
	read -p "L'éditeur à utiliser pour éditer les fichiers (vérifier votre PATH) : " editeur;
	write_config $dbname $username $userpass $editeur $host;
}

usage()
{
	echo $1;
	exit;
}

liste_themes()
{
	echo $ARBO;
}

liste_actions()
{
	ls --ignore=*.*;
}


help_prog()
{
	echo -n "
Bienvenue dans l'aide.
Ce programme a été écrit pour vous éviter de vous souvenir quelle est l'arborescence des fichiers du projet.
[Usage] : $EXEC [Action] [Chemin du thème] [Cible de l'action]

Action :
	";
	liste_actions;
	echo -n "
Vous pouvez également faire $EXEC add [Action] pour créer une action et générer l'arborescence des thèmes automatiquement.

Chemin du thème :
	";
	liste_themes;
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
			chemin=$1/$2;
			mkdir -p $chemin;
			touch $chemin/all.sql $chemin/all_tables.sql $chemin/all_contenu.sql;			
			echo " Done";
		else
			usage "Le thème '$2' pour l'action '$1' existe déjà.";
		fi
	else
		usage "L'action '$1' n'existe pas et vous ne pouvez pas en créer de nouvelles. Faites $EXEC pour obtenir
		la liste des actions reconnues";
	fi
}

create_arbo()
{
	if [ -d $1 ]
	then		
		echo -n "Copie de l'arborescence depuis l'action 'create'......";
		cp -r ./create/* ./$1;
		echo -n " Done
Mise à jour des chemins dans les fichiers sql....";
		sed -i "s/create/$1/g" $1/all*.sql;
		sed -i "s/create/$1/g" $1/*/all*.sql;		
		echo -n " Done
Suppression des commandes create dans pour chaque thème......."
		sed -i "/SOURCE/!d" $1/*/all_tables.sql;
		echo -n " Done
Suppression du contenu des fichiers sql pour les sous-themes......";
		for f in $(ls delete/*/*/*.sql)
		do
			echo "" > $f;
		done
		echo " Done";
	else
		usage "Vous devez d'abord créer l'action '$1' avant de pouvoir créer l'arborescence des thèmes.";
	fi
}

create_action()
{
	if [ ! -d $1 ]
	then
		mkdir ./$1;
		create_arbo $1
	else
		usage "L'action '$1' existe déjà";
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
				usage "Pour le thème '$2' de l'action '$1', une modification de '$3' n'est pas possible";
			fi
		else
			usage "Thème inconnu. Faite $EXEC help pour obtenir la liste des thèmes reconnus";
		fi
	else
		usage "Action inconnue. Faite $EXEC help pour obtenir la liste des actions reconnues";
	fi
}

exec_action_all()
{
	if [ -d ./$1 ]
	then
		echo "Vous voulez executer l'action '$1' pour tous les thèmes. 
		Fonctionnalité à venir";
	else
		usage "Action inconnue. Faites $EXEC help pour obtenir la liste des actions reconnues";
	fi
}

# Permet de modifier le fichier de configuration de l'utilisateur en cas de fausse manipulation
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
# On est sûr que la configuration est renseignée, on met donc à jour la ligne de commande d'exécution du fichier mysql
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
		case $1 in
			"add")
				echo "Vous souhaitez créer l'action '$2'"
				create_action $2
			;;
			*)
				case $2 in
					"all")
						echo "Vous ";
					;;
					*)
						echo "Vous souhaitez créer le thème '$2' pour l'action '$1'";
						create_theme $1 $2
					;;
				esac
			;;
		esac
		;;
	3)
		case $3 in
			"contenu")
				exec_sql $1 $2 $3;				
			;;
			"tables")
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