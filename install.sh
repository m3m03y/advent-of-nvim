#!/bin/bash

update_system() {
if [[ "$OS" = "debian" || "$OS" = "ubuntu" ]]; then
	sudo apt update
elif [[ "$OS" = "rhel" || "$OS" = "fedora" ]]; then
	sudo dnf upgrade
elif [[ "$OS" = "suse" ]]; then
	sudo zypper ref
elif [[ "$OS" = "arch" ]]; then
	sudo pacman -Syu
elif [[ "$OS" = "alpine" ]]; then
	sudo apk update
fi
}

install_prerequisites() {
if [[ "$OS" = "debian" || "$OS" = "ubuntu" || "$OS" = "kali" ]]; then
	sudo apt install ninja-build gettext cmake unzip curl build-essential
elif [[ "$OS" = "rhel" || "$OS" = "fedora" ]]; then
	sudo dnf -y install ninja-build cmake gcc make unzip gettext curl glibc-gconv-extra
elif [[ "$OS" = "suse" ]]; then
	sudo zypper install ninja cmake gcc-c++ gettext-tools curl
elif [[ "$OS" = "arch" ]]; then
	sudo pacman -S base-devel cmake unzip ninja curl
elif [[ "$OS" = "alpine" ]]; then
	sudo apk add build-base cmake coreutils curl unzip gettext-tiny-dev
fi
}

# Define color codes
NC='\033[0m'        # No Color (reset to default)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'

OS=$(grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')
INSTALL_DIR=".install"
echo -e "${BLUE}Detected OS: $OS.${NC}"

is_upgrade="none"

while [[ "$is_upgrade" != "y" && "$is_upgrade" != "n" ]]; do
	echo -e "${YELLOW}Do you want to upgrade existing packages [y/n]: ${NC}"
	read is_upgrade

	if [[ "$is_upgrade" = 'y' ]]; then
		update_system
	fi
done

echo -e "${BLUE}Installing prerequisites.${NC}"
install_prerequisites

echo -e "${BLUE}Clone git repository.${NC}"
git clone --branch stable --depth 1 https://github.com/neovim/neovim $INSTALL_DIR

echo -e "${BLUE}Installing neovim.${NC}"
cd $INSTALL_DIR || exit
make CMAKE_BUILD_TYPE=RelWithDebInfo

if [[ "$OS" = "debian" || "$OS" = "ubuntu" ]]; then
	cd build || exit
       	cpack -G DEB && sudo dpkg -i nvim-linux64.deb
else
	make install
fi 

echo -e "${GREEN}Neovim installed successfully.${NC}"

echo -e "${RED}Clean up.${NC}"
cd .. && rm -rf $INSTALL_DIR
