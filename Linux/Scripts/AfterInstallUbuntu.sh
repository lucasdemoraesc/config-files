#!/bin/bash

(
	CPF_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/Scripts/cpf.sh"
	LMC_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/Scripts/lmc.sh"
	BASHRC_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/.bashrc"
	ZSHRC_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/Zsh/.zshrc"
	CHROME_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	VIMIX_URL="https://ppload-com.s3.eu-central-1.amazonaws.com/data/files/1460753224/Vimix-1080p.tar.xz?response-content-disposition=attachment%3B%2520Vimix-1080p.tar.xz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIATLQUPBWASZL2ZPWI%2F20230208%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20230208T124701Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=1744b8f0012148914968b4611189c6d41d135d264290a7cd49b68d5e881f9634"

	function RemoverProgramasInuteis() {
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

	function AtualizarPacotes() {
		echo "🚀 Atualizando pacotes oficiais"
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install -f
		sudo dpkg --configure -a
		echo -e "✅ Atualização de pacotes finalizada\n\n"
	}

	function InstalarProgramasRepoOficial() {
		echo "🛠️ Instalando aplicativos do repositório oficial"
		sudo apt-get install \
		neofetch \
		guake \
		flameshot \
		gparted \
		vim \
		tar \
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

	function InstalarProgramasSnap() {
		echo "📦️ Instalando pacotes snaps"
		sudo snap install spotify && echo -e "✅ Snap spotify instalado" || echo -e "❌ Falha snap spotify"
		sudo snap install dbeaver-ce && echo -e "✅ Snap dbeaver-ce instalado" || echo -e "❌ Falha snap dbeaver-ce"
		sudo snap install lepton && echo -e "✅ Snap lepton instalado" || echo -e "❌ Falha snap lepton"
		sudo snap install cacher && echo -e "✅ Snap cacher instalado" || echo -e "❌ Falha snap cacher"
		sudo snap install telegram-desktop && echo -e "✅ Snap telegram-desktop instalado" || echo -e "❌ Falha snap telegram-desktop"
		sudo snap install postman && echo -e "✅ Snap postman instalado" || echo -e "❌ Falha snap postman"
		sudo snap install discord && echo -e "✅ Snap discord instalado" || echo -e "❌ Falha snap discord"
		sudo snap install emote && echo -e "✅ Snap emote instalado" || echo -e "❌ Falha snap emote"
		sudo snap install bitwarden && echo -e "✅ Snap bitwarden instalado" || echo -e "❌ Falha snap bitwarden"

		echo -e "\n\n"
	}

	function InstalarGrupCustomizer() {
		if [ ! -x "$(command -v grub-customizer)" ]; then
			echo "💥 Instalando Grub Customizer [PPA]"
			sudo add-apt-repository ppa:danielrichter2007/grub-customizer
			sudo apt-get update
			sudo apt-get install grub-customizer && echo -e "✅ Grub Customizer instalado com sucesso" || echo -e "❌ Falha ao instalar Grub Customizer"
			echo "Baixando tema Vimix"
			# Baixar...
		fi
	}

	function InstalarGoogleChrome() {
		if [ ! -x "$(command -v google-chrome)" ]; then
			echo "🌐 Instalando Google Chrome [DEB]"
			curl -o ~/Downloads/google-chrome-stable_current_amd64.deb $CHROME_URL --fail --show-error
			if [ -e ~/Downloads/google-chrome-stable_current_amd64.deb ]; then
				sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb && rm -f ~/Downloads/google-chrome-stable_current_amd64.deb && echo -e "✅ Google Chrome instalado com sucesso\n\n" || echo -e "❌ Falha ao instalar o Google Chrome\n\n"
			else
				echo -e "❌ Falha ao instalar o Google Chrome, arquivo não baixado\n\n"
			fi
		fi
	}

	function InstalarVsCode() {
		if [ ! -x "$(command -v code)" ]; then
			echo "🧑‍💻 Instalando Google Chrome [PPA]"
			sudo apt-get install software-properties-common apt-transport-https wget -y
			wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
			sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
			sudo apt install code && echo -e "✅ VS Code instalado com sucesso\n\n" || echo -e "❌ Falha ao instalar VS Code\n\n"
		fi
	}

	function ConfiguracoesBasicas() {
		echo "🛠️ Executando configurações básicas"
		curl -o ~/.bashrc $BASHRC_URL --fail --show-error && echo -e "✅ Bashrc atualizado com sucesso" || echo -e "❌ Falha ao atualizar Bashrc"
		sudo sh -c "echo 'Defaults pwfeedback' > /etc/sudoers.d/0pwfeedback" && echo -e "✅ Feedback ao digitar senha configurado" || echo -e "❌ Falha ao configurar feedback ao digitar senha"
		gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews' && echo -e "✅ Minimze on click configurado\n\n" || echo -e "❌ Falha: Minimze on click não configurado\n\n"
	}

	function ConfigurarDotnet() {
		# Baixar script dotnet-install e adicionar ao PATH
		# Instalar SDK e Runtime dotnet 6 e 7
		echo "Todo"
	}

	function ConfigurarGit() {
		sudo apt-get install git
		# Instalar git credencial manager pelo dotnet-tool...
		# Copiar arquivo .gitconfig para ~/.gitconfig
	}

	function ConfigurarDocker() {
		if [ ! -x "$(command -v docker)" ] || [ ! -e /etc/apt/sources.list.d/docker.list ]; then
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
		fi
	}

	function ConfigurarZSH() {
		# Instalar ZSH
		# Instalar Oh My Zsh
		 # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		# Copiar arquivo ./zshrc para ~/.zshrc
		echo "Todo"
	}

	function ConfigurarNode() {
		# Instalar NVM
		# Instalar Node 16 e 18 pelo NVM
		# Habilitar o corepack
		echo "Todo"
	}

	function ConfigurarAngular() {
		# Instalar a CLI do Angular globalmente
		echo "Todo"
	}

	function InstalarFontes() {
		# Instalar fontes do diretório /Fontes globalmente
		echo "Todo"
	}

	function InstalarScriptLmcEGeracaoDeCpf() {
		echo "📜 Instalando script cpf.sh"
		sudo curl -o /bin/cpf $CPF_URL --fail --show-error
		sudo chmod +x /bin/cpf && echo -e "✅ Script cpf instalado com sucesso\n\n" || echo -e "❌ Falha ao dar permissão para /bin/cpf\n\n"

		echo "📜 Instalando script lmc.sh"
		sudo curl -o /bin/lmc $LMC_URL  --fail --show-error
		sudo chmod +x /bin/lmc && echo -e "✅ Script lmc instalado com sucesso\n\n" || echo -e "❌ Falha ao dar permissão para /bin/lmc\n\n"
	}

	function ExibirLembretesPosInstalacao() {
		echo "Todo"
	}

	RemoverProgramasInuteis;
	AtualizarPacotes;
	InstalarProgramasRepoOficial;
	InstalarProgramasSnap;
	InstalarGrupCustomizer;
	InstalarGoogleChrome;
	ConfiguracoesBasicas;
	ConfigurarDocker;
	InstalarScriptLmcEGeracaoDeCpf;

) 2>&1 | tee after-install.log
