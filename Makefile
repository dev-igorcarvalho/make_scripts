all:update ubuntu_extras flutter libre_office chrerrytree docker docker_compose sdk_man update
update:
	@echo 
	@echo ___--- ATUALIZANDO SISTEMA ---___
	@echo 
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove -y
ubuntu_extras:
	@echo 
	@echo ___--- INSTALANDO EXTRAS ---___
	@echo 
	sudo apt install timeshift -y
	sudo apt install ubuntu-restricted-extras -y
	sudo apt install curl -y
	sudo apt install snapd -y
sdk_man:
	@echo 
	@echo ___--- INSTALANDO SDKMAN ---___
	@echo 
	curl -s "https://get.sdkman.io" | bash
	source "/home/datagrupo/.sdkman/bin/sdkman-init.sh"
	sdk install java 11.0.12-open
	sdk install java 8.0.265-open
docker:
	@echo 
	@echo ___--- INSTALANDO DOCKER ---___
	@echo 
	sudo apt-get update
	sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	@ echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(shell lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	#@echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu   hirsute stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io
	sudo usermod -aG docker $(USER)
	newgrp docker
docker_compose:
	@echo 
	@echo ___--- INSTALANDO DOCKER-COMPOSE ---___
	@echo 
	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(shell uname -s)-$(shell uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
flutter:
	@echo 
	@echo ___--- INSTALANDO FLUTTER ---___
	@echo 
	sudo snap install flutter --classic
	flutter doctor
libre_office:
	@echo 
	@echo ___--- INSTALANDO LIBRE-OFFICE ---___
	@echo 
	sudo add-apt-repository ppa:libreoffice/ppa
	sudo apt update
	sudo apt install libreoffice -y
cherrytree:
	@echo 
	@echo ___--- INSTALANDO LIBRE-OFFICE ---___
	@echo 
	sudo apt update
	sudo snap install cherrytree
toolbox:
	sudo chmod 776 jetbrains-toolbox.sh
	./jetbrains-toolbox.sh
