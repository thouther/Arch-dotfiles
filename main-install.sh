#!/usr/bin/env bash

# =======================================
# import
# =======================================

source $PWD/install/variables.sh
source $PWD/install/env-install.sh
source $PWD/install/pre-install.sh

# =======================================
# function
# =======================================

function pre_install {

  add_Repos
  add_mirrorlist
  change_visudo
  install_keyring
  install_needed_tools
  add_User
  backend_aria2
}

function env_install {

  install_Pack
  install_Zsh
  install_Ranger
  install_Rofi
  install_bspwm
  install_nerdfont
  install_SSR
  install_Vim
  install_Vim_Config
  install_Emacs
  install_Tmux
  install_Pacman
  install_AUR
  install_config
  install_Selected_Tools
}


# =======================================
# Main
# =======================================

#if ask "`color_aqua "Auto Mode (~15mins)"`" Y; then
#  install_Pack 
#  install_Vim
#  install_Ranger
#  install_Tmux
#  install_Rofi
#  install_SSR
#  install_Pacman
#  install_AUR
#  install_config
#  install_bspwm
#  install_nerdfont
#  install_Zsh
#  exit 0
#fi

pre_install_intro

if ask "`color_aqua "Start pre-install part?"`" Y; then
  pre_install
fi

env_install_intro
env_install
