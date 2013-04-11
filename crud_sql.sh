#!/bin/bash

EXEC_CONFIG="./exec_sql.sh"
PATH_CONFIG="../config_ifrpgmaker.sh";

MYSQL_EXEC="";
EXEC="./crud_sql.sh"
PARAM='%';
FORMAT_DATE='+%y%m%d_%H%M';
DIR_TMP="./tmp"
FIC_TMP="${DIR_TMP}/"$(date "${FORMAT_DATE}").sql;

getNextParam()
{	
	clear;
	if [ $2 -le 0 ]
	then
		chaine=$1;
	else
		out=$(cat ${FIC_TMP})
		chaine=$(echo ${out:$2 - 1})
	fi	
	echo "Requête à traiter : '${chaine}'";
	pos_debut=$(expr index "$chaine" ${PARAM});

	chaine_tmp=${chaine:${pos_debut}};
	pos_fin=$(expr index "$chaine_tmp" ${PARAM});
	if [ ${pos_fin} -gt 0 ]
	then
		param=${chaine:${pos_debut}:${pos_fin} -1};
		echo "ATTENTION : Merci de ne pas utiliser les caractères \". Utilisez plutôt le caractère ' deux fois";
		echo -n "Le paramètre" ${param} "doit être défini. Veuillez indiquer sa valeur : ";
		read val_arg;		
		let "pos_fin=$2 + ${pos_debut} + ${#val_arg} + 1";
		sed -i "s/%${param}%/${val_arg}/g" ${FIC_TMP};
		out=$(cat ${FIC_TMP});
		let "pos_max=${#out} - 1";
		if [ ${pos_fin} -lt ${pos_max} ]
		then		
			getNextParam "${chaine}" ${pos_fin};
		else	
			$MYSQL_EXEC < ${FIC_TMP};
			echo "Fin analyse";
		fi
	fi
}

main()
{
	SEPARATOR="----------------------------------------------------------";

	echo "
${SEPARATOR}
		Voici ce qu'il est possible de faire.
${SEPARATOR}
Créer 			(insert)
Afficher 		(select)
Mettre à jour   	(update)
Supprimer 		(delete)
${SEPARATOR}
Quitter 		(quit)
${SEPARATOR}
"
	ok=0;
	requete_type=0;

	while [ ${ok} -eq 0 ]
	do		
		read -p "Que voulez vous faire (écrire la commande sql en minuscule)?
Action : " action;

		case ${action} in
			insert | select)
			#	requete_type=1;
				ok=1
			;;
			update | delete )
				ok=1
			;;							
			"quit")				
				exit;
				;;
			*)
				echo "Commande non reconnue.";
				ok=0;
				;;
		esac		
	done

if [ ${requete_type} -eq 0]
then
	echo "
	${SEPARATOR}
	Voici la liste des tables triées par module qui sont disponibles.
	"

	cat index_tables.txt;

	read -p "
	${SEPARATOR}
	Indiquez le nom de la table sur laquelle vous voulez faire "${action}" selon le modèle suivant [module]:[Table]

	Exemple : joueur:Joueur 			pour la table Joueur
			  systeme_jeu.Classe 		pour la table Classe

	Table : " module_table_name;

		module=$(echo ${module_table_name} | cut -d":" -f1);
		table=$(echo ${module_table_name} | cut -d":" -f2);
else
	module="requete_type";
	table="";
fi

	fic=${action}/${module}.sql;

	if [ -f ${fic} ]
	then	
		clear;
		commande=$(grep "${action^^} ${table^}" ${fic});

		if [ "${commande}" = "" ]
		then
			echo "Aucune requête du type" ${action} "n'est possible pour la table" ${table} "dans le module" ${module} ;
		else
			propositions_commandes=( $(echo "${commande}" | tr " " "§" | tr ";" " ") );
						
			nb_commandes=${#propositions_commandes[*]};
			if [ $nb_commandes -gt 1 ]
			then
				echo "Il y a plusieurs commandes possibles pour cette table.
";
				for i in ${!propositions_commandes[*]}
				do
					let "id=${i} + 1";
					echo "(${id}/${nb_commandes}) ${propositions_commandes[i]};" | tr "§" " ";					
				done
				echo "";
				let "id_commande=${nb_commandes} + 2"
				while [ ${id_commande} -lt 0 -o ${id_commande} -gt ${nb_commandes} ]
				do
					read -p "Exécuter la commande n° " id_commande;
				done
				
				commande=$(echo "${propositions_commandes[$id_commande - 1]};" | tr "§" " ");
				echo "Vous avez choisi la requête suivante :" ${commande};

			elif [ $nb_commandes -eq 1 ]
			then
				echo "La commande suivante est possible pour la table " ${table} " dans le module" ${module} " (fichier : " ${fic} ")";
				echo ${commande};
			fi
			echo ${commande} > ${FIC_TMP};
			read -p "Appuyez sur une touche pour continuer" val;			
			getNextParam "${commande}" 0;
		fi
	else
		echo "Le fichier correspondant à l'action que vous désirez faire sur le module choisi n'existe pas.";
	fi
}

clear;
if [ ! -f ${PATH_CONFIG} ]
then
	${EXEC_CONFIG} "crud";
fi
source ${PATH_CONFIG};

MYSQL_EXEC="mysql -h $HOST -u $USERNAME -p$USERPASS $DBNAME ";

if [ ! -d ${DIR_TMP} ]
then
	mkdir ${DIR_TMP};
	chmod 700 ${DIR_TMP};
fi


# echo "Bienvenue dans le script qui va vous permettre d'exécuter des requêtes sql insert, delete, update ou select. Ces requêtes nécessitent des
# arguments que vous pourrez renseigner (on vous fait confiance ;)) via le script.

clear
main