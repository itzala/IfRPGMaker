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
	if [ $2 -le 0 ]
	then
		chaine=$1;
	else
		out=$(cat ${FIC_TMP})
		chaine=$(echo ${out:$2})
		echo "${chaine}";
	fi	

	pos_debut=$(expr index "$chaine" ${PARAM});
	chaine_tmp=${chaine:${pos_debut}};
	pos_fin=$(expr index "$chaine_tmp" ${PARAM});
	if [ ${pos_fin} -gt 0 ]
	then
		param=${chaine:${pos_debut}:${pos_fin} -1};
		echo "ATTENTION : Pour des raisons de sécurité, le caractère '%' ne peut pas être utilisé !";
		echo -n "Le paramètre" ${param} "doit être défini. Veuillez indiquer sa valeur : ";
		read val_arg;
		let "pos_fin=${pos_debut}+${pos_fin}";
		echo "pos_fin=${pos_debut}+${pos_fin} = ${pos_fin} ";		
		sed -i "s/%${param}%/${val_arg}/g" ${FIC_TMP};
		out=$(cat ${FIC_TMP});
		let "pos_max=${#out} - 1";		
		echo "Caractère à la position max ${pos_max} :" ${out:${pos_max}};
		echo "La position du début de la nouvelle recherche est inférieure à la position max ?
${pos_fin} < ${pos_max} ?";
		
		if [ ${pos_fin} -lt ${pos_max} ]
		then
			getNextParam $chaine $pos_fin
		else
			$MYSQL_EXEC < ${FIC_TMP};
		fi
	fi
}

main()
{
# 	SEPARATOR="---------------------------------------------------------------";

# 	read -p "
# ${SEPARATOR}
# 		Voici ce qu'il est possible de faire.
# ${SEPARATOR}
# Créer 			(insert)
# Afficher 		(select)
# Mettre à jour   	(update)
# Supprimer 		(delete)
# ${SEPARATOR}
# Quitter 		(quit)
# ${SEPARATOR}

# Que voulez vous faire (écrire la commande sql en minuscule)?
# Action : " action;

# if [ $action == "quit" ]
# then
# 	exit
# fi

# echo "
# ${SEPARATOR}
# Voici la liste des tables triées par module qui sont disponibles.
# "

# cat index_tables.txt;

# read -p "
# ${SEPARATOR}
# Indiquez le nom de la table sur laquelle vous voulez faire "${action}" selon le modèle suivant [module]:[Table]

# Exemple : joueur:Joueur 			pour la table Joueur
# 		  systeme_jeu.Classe 		pour la table Classe

# Table : " module_table_name;

# 	module=$(echo ${module_table_name} | cut -d":" -f1);
# 	table=$(echo ${module_table_name} | cut -d":" -f2);

	action="update"
	module="histoire"
	table="Intro"
	fic=${action}/${module}.sql;

	if [ -f ${fic} ]
	then
		clear;		
		commande=$(grep "${action^^} ${table^}" ${fic});		
		echo "${commande}" > ${FIC_TMP};
		cat ${FIC_TMP};
		getNextParam "${commande}" 0;
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

main