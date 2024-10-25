#!/bin/bash

(
	CPF_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/Scripts/cpf.sh"
	LMC_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/Scripts/lmc.sh"
	TOGGLE_THEME_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/Scripts/toggle-theme.sh"
	BASHRC_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/.bashrc"
	ZSHRC_URL="https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Linux/Zsh/.zshrc"
	OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
	ZINIT_DIR="$HOME/.local/share/zinit/"
	ZSH_THEMES="$HOME/.oh-my-zsh/custom/themes"
	SPACESHIP_DIR="$ZSH_THEMES/spaceship-prompt"
	CHROME_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	VIMIX_URL="https://github.com/lucasdemoraesc/config-files/raw/main/Linux/Grub/Vimix-1080p.tar.xz"
	DOTNET_INSTALL_URL="https://dot.net/v1/dotnet-install.sh"
	FONTES_URL="https://github.com/lucasdemoraesc/config-files/raw/main/Fontes/Fontes.tar.xz"

	function RecarregarProfile() {
		echo "🔄 Recarregando bash profile"
		source ~/.profile && echo -e "✅ Bash profile recarregado com sucesso\n" || echo -e "❌ Falha ao recarregar bash profile\n"
	}

	function RemoverProgramasInuteis() {
		echo "🎠 Removendo aplicativos inúteis"
		sudo apt-get purge --remove \
		aisleriot \
		gnome-font-viewer \
		gnome-mahjongg \
		gnome-mines \
		gnome-sudoku \
		transmission-common \
		transmission-gtk \
		rhythmbox \
		libreoffice-style-breeze \
		libreoffice-style-colibre \
		libreoffice-style-elementary \
		libreoffice-style-yaru \
		libreoffice-base-core \
		libreoffice-common \
		libreoffice-gnome \
		libreoffice-gtk3 \
		shotwell && echo -e "✅ Programas inúteis removidos com sucesso" || echo -e "❌ Falha ao remover programas inúteis"
	}

	function AtualizarPacotes() {
		echo "🚀 Atualizando pacotes oficiais"
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install -f
		sudo dpkg --configure -a
		echo -e "✅ Atualização de pacotes finalizada"
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
		ttf-mscorefonts-installer \
		apache2-utils \
		gnome-shell-extension-manager \
		libnss3-tools \
		syncthing \
		gnome-startup-applications \
		xclip && echo -e "✅ Aplicativos oficiais instalados com sucesso" || echo -e "❌ Falha ao instalar aplicativos oficiais"
		RecarregarProfile
	}

	function InstalarProgramasSnap() {
		echo "📦️ Instalando pacotes snaps"
		sudo snap install dbeaver-ce && echo -e "✅ Snap dbeaver-ce instalado" || echo -e "❌ Falha snap dbeaver-ce"
		sudo snap install telegram-desktop && echo -e "✅ Snap telegram-desktop instalado" || echo -e "❌ Falha snap telegram-desktop"
		sudo snap install postman && echo -e "✅ Snap postman instalado" || echo -e "❌ Falha snap postman"
		sudo snap install discord && echo -e "✅ Snap discord instalado" || echo -e "❌ Falha snap discord"
		sudo snap install emote && echo -e "✅ Snap emote instalado" || echo -e "❌ Falha snap emote"
		sudo snap install bitwarden && echo -e "✅ Snap bitwarden instalado" || echo -e "❌ Falha snap bitwarden"
		sudo snap install dbgate && echo -e "✅ Snap dbgate instalado" || echo -e "❌ Falha snap dbgate"
		sudo snap install onlyoffice-desktopeditors && echo -e "✅ Onlyoffice instalado" || echo -e "❌ Falha snap onlyoffice-desktopeditors"
		sudo snap install --classic obsidian && echo -e "✅ Obsidian instalado" || echo -e "❌ Falha snap obsidian"
		sudo snap install --classic code && echo -e "✅ VS Code instalado" || echo -e "❌ Falha snap code"
		echo -e "✅ Pacotes finalizados"
	}

	function InstalarGrupCustomizer() {
		if [ ! -x "$(command -v grub-customizer)" ]; then
			echo "💥 Instalando Grub Customizer [PPA]"
			sudo add-apt-repository ppa:danielrichter2007/grub-customizer
			sudo apt-get update
			sudo apt-get install grub-customizer && echo -e "✅ Grub Customizer instalado com sucesso" || echo -e "❌ Falha ao instalar Grub Customizer"
			echo "Baixando tema Vimix..."
			(curl -L "$VIMIX_URL" | sudo tar xJf - -C /boot/grub/themes/) && echo -e "✅ Vimix baixado e adicionado à pasta /boot/grub/themes" || echo -e "❌ Falha ao baixar tema Vimix"
		fi
	}

	function InstalarGoogleChrome() {
		if [ ! -x "$(command -v google-chrome)" ]; then
			echo "🌐 Instalando Google Chrome [DEB]"
			curl -o ~/Downloads/google-chrome-stable_current_amd64.deb "$CHROME_URL" --fail --show-error
			if [ -e ~/Downloads/google-chrome-stable_current_amd64.deb ]; then
				sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb && rm -f ~/Downloads/google-chrome-stable_current_amd64.deb && echo -e "✅ Google Chrome instalado com sucesso" || echo -e "❌ Falha ao instalar o Google Chrome"
			else
				echo -e "❌ Falha ao instalar o Google Chrome, arquivo não baixado"
			fi
		fi
	}

	function ConfiguracoesBasicas() {
		echo "🛠️ Executando configurações básicas"
		curl -o ~/.bashrc "$BASHRC_URL" --fail --show-error && echo -e "✅ Bashrc atualizado com sucesso" || echo -e "❌ Falha ao atualizar Bashrc"
		sudo sh -c "echo 'Defaults pwfeedback' > /etc/sudoers.d/0pwfeedback" && echo -e "✅ Feedback ao digitar senha configurado" || echo -e "❌ Falha ao configurar feedback ao digitar senha"
		gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews' && echo -e "✅ Minimize on click configurado" || echo -e "❌ Falha: Minimize on click não configurado"
		echo -e "✅ Configurações básicas finalizadas"
	}

	function ConfigurarDotnet() {
		if [ ! -e /usr/bin/dotnet-install ] && [ ! -x "$(command -v dotnet-install)" ]; then
			echo -e "💎 Instalando Script Dotnet Install"
			(sudo curl -L "$DOTNET_INSTALL_URL" -o /usr/bin/dotnet-install && sudo chmod +x /usr/bin/dotnet-install) && echo -e "✅ Script dotnet-install.sh instalado com sucesso" || echo -e "❌ Falha ao instalar script dotnet-install.sh"
			RecarregarProfile
		fi
		if [ ! -x "$(command -v dotnet)" ]; then
			echo -e "💎 Instalando Dotnet LTS (Long Term Support)"
			dotnet-install --channel LTS && echo -e "✅ Dotnet LTS instalado com sucesso" || echo -e "❌ Falha ao instalar Dotnet LTS"
			echo -e "💎 Instalando Dotnet STS (Standard Term Support)"
			dotnet-install --channel STS && echo -e "✅ Dotnet STS instalado com sucesso" || echo -e "❌ Falha ao instalar Dotnet STS"
			RecarregarProfile
		fi
	}

	function ConfigurarGit() {
		if [ ! -x "$(command -v git)" ]; then
			echo -e "🔄 Instalando o Git"
			sudo apt-get install git
			if [ "$?" -eq 0 ]; then
				echo -e "✅ Git instalado com sucesso, efetuando configurações básicas"
				git config --global user.name "Lucas Moraes" && echo -e "➡️ user.name = \"Lucas Moraes\""
				git config --global user.email "lucasdemoraesc@gmail.com" && echo -e "➡️ user.name = \"lucasdemoraesc@gmail.com\""
				git config --global init.defaultBranch main && echo -e "➡️ init.defaultBranch = \"main\""
				git config --global core.editor "vim" && echo -e "➡️ core.editor = \"vim\""
				git config --global alias.cleanupremote '!git remote prune origin' && echo -e "➡️ alias.cleanupremote = \"Ok\""
				git config --global alias.cleanuplocal '!git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d' && echo -e "➡️ alias.cleanuplocal = \"Ok\""
				git config --global alias.cleanup '!git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d; git remote prune origin' && echo -e "➡️ alias.cleanup = \"Ok\""
				RecarregarProfile;
			else
				echo -e "❌ Falha ao instalar o Git"
			fi
		fi

		if [ ! -x "$(command -v git-credential-manager)" ]; then
			echo -e "🔄 Instalando Git Credential Manager"
			if [ -x "$(command -v dotnet)" ]; then
				(dotnet tool install -g git-credential-manager) && echo -e "✅ Git Credential Manager instalado com sucesso" || echo -e "❌ Falha ao instalar Git Credential Manager"
				git-credential-manager configure  && echo -e "✅ Git Credential Manager configurado com sucesso" || echo -e "❌ Falha ao configurar Git Credential Manager"
			else
				echo -e "❌ Falha ao instalar Git Credential Manager pois nenhuma versão do Dotnet foi encontrada"
			fi
		fi
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
			if [ "$?" -eq 0 ]; then
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
				echo -e "✅ Configuração do Docker finalizada"
			else
				echo -e "❌ Falha ao instalar o Docker, verifique os logs"
			fi
		fi
	}

	function ConfigurarZSH() {
		if [ ! -x "$(command -v zsh)" ]; then
			echo -e "🐚 Instalando ZSH"
			sudo apt-get install zsh && echo -e "✅ ZSH instalado com sucesso" || echo -e "❌ Falha ao instalar ZSH"
			curl -L "$ZSHRC_URL" -o ~/.zshrc && echo -e "✅ .zshrc atualizado com sucesso" || echo -e "❌ Falha ao atualizar .zshrc"
			echo -e "🐚 Definindo ZSH como padrão"
			chsh -s "$(which zsh)"
		fi
		if [ ! -d "$OH_MY_ZSH_DIR" ]; then
			echo -e "🐚 Instalando Oh My ZSH"
			sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo -e "✅ Oh My ZSH instalado com sucesso" || echo -e "❌ Falha ao instalar Oh My ZSH"
		fi
		if [ ! -d "$ZINIT_DIR" ]; then
			echo -e "🐚 Instalando Zinit"
			bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)" && echo -e "✅ Zinit instalado com sucesso" || echo -e "❌ Falha ao instalar Zinit"
		fi
		if [ ! -d "$SPACESHIP_DIR" ]; then
			echo -e "🌌 Baixando tema spaceship"
			git clone https://github.com/denysdovhan/spaceship-prompt.git "$SPACESHIP_DIR" && echo -e "✅ Tema spaceship baixado com sucesso" || echo -e "❌ Falha ao baixar tema spaceship"
			ln -s "$SPACESHIP_DIR/spaceship.zsh-theme" "$ZSH_THEMES/spaceship.zsh-theme"
		fi
	}

	function ConfigurarNode() {
		if [ ! -d ~/.nvm/ ]; then
			echo -e "🟩 Instalando o Node (NVM)"
			(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash)
			if [ "$?" -eq 0 ]; then
				echo -e "✅ NVM instalado com sucesso, carregando..."
				export NVM_DIR="$HOME/.nvm"
				[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
				[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

				nvm install --lts
				if [ "$?" -eq 0 ]; then
					echo -e "✅ Node LTS instalado com sucesso"
					corepack enable
				else
					echo -e "❌ Falha ao instalar Node LTS"
				fi
			else
				echo -e "❌ Falha ao instalar NVM"
			fi
		fi
	}

	function ConfigurarAngular() {
		if [ ! -x "$(command -v ng)" ]; then
			echo -e "🩸 Instalando a CLI do Angular"
			npm install -g @angular/cli  && echo -e "✅ Angular instalado com sucesso" || echo -e "❌ Falha ao instalar Angular"
		fi
	}

	function InstalarFontes() {
		echo -e "🔠 Instalando fontes"
		(mkdir "$HOME"/Downloads/Fontes && curl -L "$FONTES_URL" | tar xJf - -C "$HOME"/Downloads/Fontes)
		if [ "$?" -eq 0 ]; then
			echo -e "✅ Fontes baixadas com sucesso, instalando..."
			(font-manager -i "$HOME"/Downloads/Fontes/* && fc-cache -rf && font-manager -u) && echo -e "✅ Fontes instaladas com sucesso" || echo -e "❌ Falha ao instalar Fontes"
		else
			echo -e "❌ Falha ao baixar arquivo de fontes, verifique os logs"
		fi
		rm -r "$HOME"/Downloads/Fontes
	}

	function InstalarScriptsPessoais() {
		echo "📜 Instalando script cpf.sh"
		(sudo curl -o /bin/cpf "$CPF_URL" --fail --show-error && sudo chmod +x /bin/cpf) && echo -e "✅ Script cpf instalado com sucesso" || echo -e "❌ Falha ao dar permissão para /bin/cpf"

		echo "📜 Instalando script lmc.sh"
		(sudo curl -o /bin/lmc "$LMC_URL" --fail --show-error && sudo chmod +x /bin/lmc) && echo -e "✅ Script lmc instalado com sucesso" || echo -e "❌ Falha ao dar permissão para /bin/lmc"

		echo "📜 Instalando script toggle-theme.sh"
		(sudo curl -o /bin/toggle-theme "$TOGGLE_THEME_URL" --fail --show-error && sudo chmod +x /bin/toggle-theme) && echo -e "✅ Script toggle-theme instalado com sucesso" || echo -e "❌ Falha ao dar permissão para /bin/toggle-theme"
	}

	function ExibirLembretesPosInstalacao() {
		echo -e "🎉 Execução concluída. Verifique os logs para garantir que todas as etapas foram executadas corretamente."
		echo -e "Etapas manuais:"
		echo -e "- [ ] Configurar a tela de inicialização através do Grub Customizer"
		echo -e "- [ ] Configurar inicialização automática do Syncthing, comando: syncthing serve --no-browser --logfile=default"
		echo -e "- [ ] Remover partições do Windows da interface pelo app \"Discos\""
		echo -e "\t- [ ] Configurar lixeira para partições NTFS: https://askubuntu.com/a/1319280/1549502"
		echo -e "- [ ] Instalar e configurar as seguintes extensões:"
		echo -e "\t- [ ] Alphabetical App Grid"
		echo -e "\t- [ ] Clipboard Indicator"
		echo -e "\t- [ ] Current screen only on Window Switcher"
		echo -e "\t- [ ] Places Status Indicator"
		echo -e "\t- [ ] User Themes X"
  		echo -e "\t- [ ] Color Picker"
		echo -e "- [ ] Configurar os atalhos:"
		echo -e "\t- [ ] Novo: \"Emote\" -> emote -> [Super + .]"
		echo -e "\t- [ ] Novo: \"Guake\" -> guake -t -> [F12] (Na aplicação Guake, desabilitar o atalho F12 padrão)"
		echo -e "\t- [ ] Novo: \"Nautilus\" -> nautilus -w -> [Super + E]"
		echo -e "\t- [ ] Novo: \"Toggle theme\" -> toggle-theme -> [Ctrl + Super + T]"
		echo -e "\t- [ ] Alterar: \"Mostrar a lista de notificações\" -> [Desabilitado]"
		echo -e "\t- [ ] Alterar: \"Fazer uma captura de tela\" -> [Print]"
		echo -e "\t- [ ] Alterar: \"Fazer uma captura de tela de uma janela\" -> [Super + Print]"
		echo -e "\t- [ ] Alterar: \"Fazer uma captura de tela interativamente\" -> [Shift + Super + S]"
		echo -e "\t- [ ] Alterar: \"Fazer uma gravação de tela interativamente\" -> [Shift + Super + G]"
		echo -e "- [ ] Definir tema padrão do Guake: Thayer Bright"
		echo -e "- [ ] Em Configurações, atualizar preferencias de aparência, multitarefa e limpeza automática da lixeira (Menu \"Privacidade\")"
		echo -e "- [ ] Corrigir delay dos atalhos com a tecla FN (se estiver ocorrendo)"
		echo -e "\t- [ ] No arquivo: \"/usr/share/X11/xkb/symbols/br\""
		echo -e "\t- [ ] Comentar a linha: \"modifier_map Mod3 { Scroll_Lock };\""
		echo -e "\t- [ ] Após salvar executar o comando: \"setxkbmap\""
		echo -e "- [ ] Efetuar login em seus aplicativos"
		echo -e "- [ ] Configurar Obsidian (Testar snap instalado)"
	}

	RemoverProgramasInuteis; echo -e "\n"
	AtualizarPacotes; echo -e "\n"
	InstalarProgramasRepoOficial; echo -e "\n"
	InstalarProgramasSnap; echo -e "\n"
	InstalarGrupCustomizer; echo -e "\n"
	InstalarGoogleChrome; echo -e "\n"
	ConfiguracoesBasicas; echo -e "\n"
	ConfigurarDotnet; echo -e "\n"
	ConfigurarGit; echo -e "\n"
	ConfigurarDocker; echo -e "\n"
	ConfigurarZSH; echo -e "\n"
	ConfigurarNode; echo -e "\n"
	ConfigurarAngular; echo -e "\n"
	InstalarFontes; echo -e "\n"
	InstalarScriptsPessoais; echo -e "\n"
	ExibirLembretesPosInstalacao;
) 2>&1 | tee after-install.log
