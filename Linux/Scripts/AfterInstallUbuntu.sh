#!/bin/bash

# Comando para minimizar ao clicar: gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'

# Script para configuração do Ubuntu

InstalarScriptLmcEGeracaoDeCpf() {
	echo "📜 Instalando script cpf.sh"
	CPF_URL="https://github.com/lucasdemoraesc/config-files/blob/main/Linux/Scripts/cpf.sh"
	sudo wget -O /bin/cpf CPF_URL >> after-log.txt 2> after-error.txt
	sudo chmod +x /bin/cpf >> after-log.txt 2> after-error.txt

	echo "📜 Instalando script lmc.sh"
	LMC_URL="https://github.com/lucasdemoraesc/config-files/blob/main/Linux/Scripts/lmc.sh"
	sudo wget -O /bin/lmc LMC_URL >> after-log.txt 2> after-error.txt
	sudo chmod +x /bin/lmc >> after-log.txt 2> after-error.txt
}

AtualizarPacotes() {
	echo "🚀 Atualizando pacotes..."
	sleep 1s
	sudo apt-get update >> after-log.txt 2> after-error.txt
	sudo apt-get upgrade >> after-log.txt 2> after-error.txt
	sudo apt-get install -f >> after-log.txt 2> after-error.txt
	sudo dpkg --configure -a >> after-log.txt 2> after-error.txt
}

RemoverProgramasInuteis() {
	echo "🎠 Removendo aplicativos inúteis"
	sleep 1s
	sudo apt purge --remove \
		aisleriot \
		gnome-font-viewer \
		gnome-mahjongg \
		gnome-mines \
		gnome-sudoku \
		rhythmbox \
		shotwell \
		>> after-log.txt 2> after-error.txt
}

InstalarProgramasRepoOficial() {
	echo "🛠️ Instalando aplicativos do repositório oficial"
	sleep 1s
	sudo apt install \
		neofetch \
		nautilus-actions \
		filemanager-actions \
		filemanager-actions-doc \
		flameshot \
		grub-customizer \
		gparted \
		vim \
		gnome-tweaks \
		gnome-tweak-tool \
		deborphan \
		qbittorrent \
		htop \
		font-manager \
		vlc \
		wget \
		>> after-log.txt 2> after-error.txt
}

InstalarProgramasSnap() {
	echo "📦️ Instalando pacotes snaps"
	sleep 1s
	snap install \
		spotify \
		dbeaver-ce \
		telegram-desktop \
		postman \
		discord \
		emote \
		skype \
		bitwarden \
		>> after-log.txt 2> after-error.txt
}
