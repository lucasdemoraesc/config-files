#!/bin/bash

HELP() {
cat << EOF
LMC, is a software built to aid you in mudance and boring tasks in your
Debian Like system.

Syntax:
	lmc [OPÇÃO]

Opções:
	cl | clean
	   Limpa o sistema

	up | update
	   Atualiza a lista de pacotes e o sistema, também tenta resolver alguns
	   possíveis problemas com depêndencias desencontradas

	help
	   Exibe este conteúdo de ajuda

EOF
}

CLEAN() {

	if [ ! -x "$(command -v deborphan)" ]; then
		sudo apt-get install deborphan
	fi

	sudo apt-get autoremove
	sudo apt-get clean
	sudo apt-get autoclean
	sudo apt-get -f install
	sudo apt-get -y autoclean
	sudo apt-get -y clean
	sudo apt-get autoremove "$(deborphan)"
	sudo deborphan | xargs sudo apt-get -y remove
	sudo deborphan --guess-data | xargs sudo apt-get -y remove
}

UP() {
	sudo apt-get install -f
	sudo apt-get update
	sudo apt-get upgrade
	sudo dpkg --configure -a
}


case $1 in

	clean|cl) CLEAN 2>&- ;;
	update|up) UP 2>&- ;;
	help) HELP 2>&- ;;
	*) echo -e "Sintaxe incorreta\nTry \"lmc help\" for more info";;

esac
