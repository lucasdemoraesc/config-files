#!/bin/bash

(
	CPF_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/Scripts/cpf.sh"
	LMC_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/Scripts/lmc.sh"
	BASHRC_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/.bashrc"
	ZSHRC_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/Zsh/.zshrc"
	CHROME_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

	RemoverProgramasInuteis() {
		echo "🎠 Removendo aplicativos inúteis"
		sudo apt-get purge --remove \
		aisleriot \
		gnome-font-viewer \
		gnome-mahjongg \
		gnome-mines \
		gnome-sudoku \
		rhythmbox \
		shotwell && echo -e "✅ Programas inúteis removidos com sucesso\n\n" || echo -e "❌ Falha ao remover programas inúteis\n\n"
	}

	AtualizarPacotes() {
		echo "🚀 Atualizando pacotes oficiais"
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install -f
		sudo dpkg --configure -a
		echo -e "✅ Atualização de pacotes finalizada\n\n"
	}

	InstalarProgramasRepoOficial() {
		echo "🛠️ Instalando aplicativos do repositório oficial"
		sudo apt-get install \
		neofetch \
		guake \
		flameshot \
		gparted \
		vim \
		gnome-tweaks \
		dconf-editor \
		nautilus-admin \
		nautilus-extension-gnome-terminal \
		nautilus-sendto \
		nautilus-share \
		deborphan \
		htop \
		font-manager \
		vlc \
		wget \
		curl \
		xclip && echo -e "✅ Aplicativos oficiais instalados com sucesso\n\n" || echo -e "❌ Falha ao instalar aplicativos oficiais\n\n"
	}

	InstalarProgramasSnap() {
		echo "📦️ Instalando pacotes snaps"
		snap install \
		spotify \
		dbeaver-ce \
		lepton \
		cacher \
		telegram-desktop \
		postman \
		discord \
		emote \
		bitwarden && echo -e "✅ Pacotes snap instalados com sucesso\n\n" || echo -e "❌ Falha ao instalar pacotes snap\n\n"
	}

	InstalarGrupCustomizer() {
		echo "💥 Instalando Grub Customizer [PPA]"
		sudo add-apt-repository ppa:danielrichter2007/grub-customizer
		sudo apt-get update
		sudo apt-get install grub-customizer && echo -e "✅ Grub Customizer instalado com sucesso\n\n" || echo -e "❌ Falha ao instalar Grub Customizer\n\n"
	}

	InstalarGoogleChrome() {
		echo "🌐 Instalando Google Chrome [DEB]"
		curl -o ~/Downloads/google-chrome-stable_current_amd64.deb $CHROME_URL --fail --show-error
		if [ -e ~/Downloads/google-chrome-stable_current_amd64.deb ]; then
			sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb && rm -f ~/Downloads/google-chrome-stable_current_amd64.deb && echo -e "✅ Google Chrome instalado com sucesso\n\n" || echo -e "❌ Falha ao instalar o Google Chrome\n\n"
		else
			echo -e "❌ Falha ao instalar o Google Chrome, arquivo não baixado\n\n"
		fi
	}

	InstalarVsCode() {
		echo "🧑‍💻 Instalando Google Chrome [PPA]"
		sudo apt-get install software-properties-common apt-transport-https wget -y
		wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
		sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
		sudo apt install code && echo -e "✅ VS Code instalado com sucesso\n\n" || echo -e "❌ Falha ao instalar VS Code\n\n"
	}

	ConfiguracoesBasicas() {
		echo "⚙️ Executando configurações básicas"
		curl -o ~/.bashrc $BASHRC_URL --fail --show-error && echo -e "✅ Bashrc atualizado com sucesso" || echo -e "❌ Falha ao atualizar Bashrc"
		gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews' && echo -e "✅ Minimze on click configurado\n\n" || echo -e "❌ Falha: Minimze on click não configurado\n\n"
	}

	ConfigurarGit() {
		sudo apt-get install git
		# Instalar git credencial manager...
	}

	ConfigurarDocker() {
		echo "🐋 Instalando o Docker"
		sudo apt-get remove docker docker-engine docker.io containerd runc
		sudo apt-get update
		sudo apt-get install \
			ca-certificates \
			curl \
			gnupg \
			lsb-release
		sudo mkdir -p /etc/apt/keyrings
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
		echo \
			"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
			$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
		sudo apt-get update
		sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
		if [ $? -eq 0 ]; then
			echo "🐳 Docker instalado com sucesso"
			if [ ! "$(getent group docker)" ]; then
				sudo groupadd docker
				sudo usermod -aG docker "$USER"
				newgrp docker
			fi
			echo "📦️ Subindo container do Portainer"
			sudo docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /home/lucas/.portainer/data:/data portainer/portainer-ce:latest
			echo "📦️ Subindo container do Postgres"
			sudo docker run --name postgres -e "POSTGRES_PASSWORD=123456" -p 5432:5432 -d postgres
			echo -e "✅ Configuração do Docker finalizada\n\n"
		else
			echo -e "❌ Falha ao instalar o Docker, verifique os logs\n\n"
		fi
	}

	ConfigurarZSH() {
		echo "Todo"
	}

	ConfigurarDotnet() {
		echo "Todo"
	}

	ConfigurarNode() {
		echo "Todo"
	}

	ConfigurarAngular() {
		echo "Todo"
	}

	InstalarFontes() {
		echo "Todo"
	}

	InstalarScriptLmcEGeracaoDeCpf() {
		echo "📜 Instalando script cpf.sh"
		sudo curl -o /bin/cpf $CPF_URL --fail --show-error
		sudo chmod +x /bin/cpf && echo -e "✅ Script cpf instalado com sucesso\n\n" || echo -e "❌ Falha ao dar permissão para /bin/cpf\n\n"

		echo "📜 Instalando script lmc.sh"
		sudo curl -o /bin/lmc $LMC_URL  --fail --show-error
		sudo chmod +x /bin/lmc && echo -e "✅ Script lmc instalado com sucesso\n\n" || echo -e "❌ Falha ao dar permissão para /bin/lmc\n\n"
	}

	# RemoverProgramasInuteis;
	# AtualizarPacotes;
	# InstalarProgramasRepoOficial;
	# InstalarProgramasSnap;
	# InstalarGrupCustomizer;
	InstalarGoogleChrome;
	# InstalarScriptLmcEGeracaoDeCpf;
	# ConfiguracoesBasicas;
	# ConfigurarDocker;

) 2>&1 | tee after-install.log
