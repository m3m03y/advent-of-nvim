#!/bin/bash

# Define color codes
NC='\033[0m'        # No Color (reset to default)
RED='\033[0;31m'
GREEN='\033[0;32m'

INSTALL_DIR=".install"

echo -e "${RED}Uninstalling neovim.${NC}"
rm -rf $INSTALL_DIR
sudo apt remove --purge neovim
echo -e "${GREEN}Neovim uninstalled.${NC}"
