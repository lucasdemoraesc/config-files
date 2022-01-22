#!/bin/bash

# Comando para minimizar ao clicar: gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'

# Script para configuração do Ubuntu

AtualizarPacotes() {
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install -f
	sudo dpkg --configure -a
}

RemoverProgramasInuteis() {

}

InstalarProgramasEssenciais() {
	echo "🛠️ Instalando alguns utilitários"
	sleep 1s
	sudo apt install neofetch nautilus-actions filemanager-actions filemanager-actions-doc flameshot grub-customizer gparted vim gnome-tweaks deborphan
}
