#!/bin/bash

# ABOUT: ----------------------------------------------------------------- #
# Name: LMC                                                                |
# Mainteainer: Lucas de M. Corrêa <lucasdemoraesc@gmail.com>               |
# Depends: One brain ;)                                                    |
# Description: LMC, is a software built to aid you in mudance and boring   |
# tasks in your Debian Like system.                                        |
# ------------------------------------------------------------------------ #
# CHANGELOG: ------------------------------------------------------------- #
# Version: 1.5                                                             |
# Release Date: Sáb Fev  3 21:00:18 -02 2018                               |
# Tarefas divididas. Funções para chamadas, o antigo menu foi descontinuado|
# Decisão "case $X in", agora chama funções por linha de comando.          |
# -------------------------------------------------------------------------#

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

	sudo apt-get autoremove
	sudo apt-get clean
	sudo apt-get autoclean
	sudo apt-get -f install
	sudo apt-get -y autoclean
	sudo apt-get -y clean
	sudo apt-get autoremove "$(deborphan)"
	sudo deborphan | xargs sudo apt-get -y remove
	sudo deborphan --guess-data | xargs sudo apt-get -y remove
	cd /home/correalinux/
	rm -rf ./.adobe ./.macromedia ./.aptitude
	rm -rf ./.cache/google-chrome/Default/Cache/*
	rm -rf ./.cache/mozilla/firefox/mwad0hks.default/cache2/entries/*
	rm -rf ./.cache/thunderbird/130liq8w.default/cache2/entries/*
	rm -rf ./.config/google-chrome/Default/Application\ Cache/Cache/*
	rm -f ./.*.old
	echo -n > ./.mpd/log
	echo -n > ./.w3m/history; cd ~/

}

UP() {

	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install -f
	sudo dpkg --configure -a

}


case $1 in

	clean|cl) CLEAN 2>&- ;;
	update|up) UP 2>&- ;;
	help) HELP 2>&- ;;
	*) echo -e "Sintaxe incorreta\nTry \"lmc help\" for more info";;

esac
