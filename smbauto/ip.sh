#!/bin/bash
clear

echo "																			   "
echo " ▄▄▄▄    ██▓     ▄████▄   ██ ▄█▀▓█████▄  ██▀███    ▄████  ▒█████   ███▄    █ "
echo "▓█████▄ ▓██▒    ▒██▀ ▀█   ██▄█▒ ▒██▀ ██▌▓██ ▒ ██▒ ██▒ ▀█▒▒██▒  ██▒ ██ ▀█   █ "
echo "▒██▒ ▄██▒██░    ▒▓█    ▄ ▓███▄░ ░██   █▌▓██ ░▄█ ▒▒██░▄▄▄░▒██░  ██▒▓██  ▀█ ██▒"
echo "▒██░█▀  ▒██░    ▒▓▓▄ ▄██▒▓██ █▄ ░▓█▄   ▌▒██▀▀█▄  ░▓█  ██▓▒██   ██░▓██▒  ▐▌██▒"
echo "░▓█  ▀█▓░██████▒▒ ▓███▀ ░▒██▒ █▄░▒████▓ ░██▓ ▒██▒░▒▓███▀▒░ ████▓▒░▒██░   ▓██░"
echo "░▒▓███▀▒░ ▒░▓  ░░ ░▒ ▒  ░▒ ▒▒ ▓▒ ▒▒▓  ▒ ░ ▒▓ ░▒▓░ ░▒   ▒ ░ ▒░▒░▒░ ░ ▒░   ▒ ▒ "
echo "▒░▒   ░ ░ ░ ▒  ░  ░  ▒   ░ ░▒ ▒░ ░ ▒  ▒   ░▒ ░ ▒░  ░   ░   ░ ▒ ▒░ ░ ░░   ░ ▒░"
echo " ░    ░   ░ ░   ░        ░ ░░ ░  ░ ░  ░   ░░   ░ ░ ░   ░ ░ ░ ░ ▒     ░   ░ ░ "
echo " ░          ░  ░░ ░      ░  ░      ░       ░           ░     ░ ░           ░ "
echo "      ░         ░                ░                                           "
echo "                                                                             "
echo "                                                                             "
echo "                                                                             "      
echo "                                                                             "      
echo "                                                                             "      
echo "                                                                             "      
echo "                                                                             "      
echo "                                                                             "      
echo "                                                                             "      
echo "                                                                             "      
echo "     ██████  ███▄ ▄███▓ ▄▄▄▄    ▄▄▄       █    ██ ▄▄▄█████▓ ▒█████           "      
echo "   ▒██    ▒ ▓██▒▀█▀ ██▒▓█████▄ ▒████▄     ██  ▓██▒▓  ██▒ ▓▒▒██▒  ██▒         "       
echo "   ░ ▓██▄   ▓██    ▓██░▒██▒ ▄██▒██  ▀█▄  ▓██  ▒██░▒ ▓██░ ▒░▒██░  ██▒         "       
echo "     ▒   ██▒▒██    ▒██ ▒██░█▀  ░██▄▄▄▄██ ▓▓█  ░██░░ ▓██▓ ░ ▒██   ██░         "       
echo "   ▒██████▒▒▒██▒   ░██▒░▓█  ▀█▓ ▓█   ▓██▒▒▒█████▓   ▒██▒ ░ ░ ████▓▒░         "       
echo "   ▒ ▒▓▒ ▒ ░░ ▒░   ░  ░░▒▓███▀▒ ▒▒   ▓▒█░░▒▓▒ ▒ ▒   ▒ ░░   ░ ▒░▒░▒░          "       
echo "   ░ ░▒  ░ ░░  ░      ░▒░▒   ░   ▒   ▒▒ ░░░▒░ ░ ░     ░      ░ ▒ ▒░          "       
echo "   ░  ░  ░  ░      ░    ░    ░   ░   ▒    ░░░ ░ ░   ░      ░ ░ ░ ▒           "       
echo "         ░         ░    ░            ░  ░   ░                  ░ ░           "       
echo "                             ░                                               "  
echo "                             ░                                               " 
echo -e "\n \n"
sleep 2

echo -e "\n"

sleep 3
echo -e "\n"
#Descargamos herramientas externas (NMAP;SMBCLIENT;NBTSCAN)
descarga(){ sudo apt-get update; sudo apt-get upgrade; sudo apt-get install nmap; sudo apt-get install smbclient; sudo apt-get install nbtscan; }

echo "Comprobaremos si existen las herramientas NMAP, NBTSCAN, SMBCLIENT, si no existe, no se preocupe, se procedera a su descarga"
sleep 5
if [ -d /usr/bin/nbtscan &> /dev/null | /usr/bin/smbclient &> /dev/null | /usr/bin/nmap &> /dev/null ];
then
clear
sleep 2
echo "Ya posee los programas necesarios"
sleep 2
clear
else
echo "Por favor aguarde, primero vamos a instalar las herramientas necesarias para que el script funcione"
descarga
echo "aguarde 10 segundos, el programa sigue solo"
sleep 10

fi


clear


echo "Ingrese una ip"
read hostname
echo -e "\n"
n(){ nmap $hostname -sV -p 137-139,445 -Pn; echo -e "\n"; nbtscan -v $hostname; echo -e "\n"; smbclient -L \\$hostname\tmp; }

sleep 3
echo -e "\n"

# Realizar un ping para ver el estado del host remoto.
	sleep 3
	ping -c 1 $hostname &> /dev/null

	if [ $? -eq 0 ]; then
		echo "Status Online"
		echo -e "\n"
		n
	else
		echo "status Offline"
	fi
