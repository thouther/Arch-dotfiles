#!/usr/bin/env bash

# function install_fonts {
#     mkdir -p $HOME/.fonts
#     mkdir -p $HOME/.local/share/fonts
#     yes | sudo cp -rf "$PWD"/fonts/* /usr/share/
#     yes | cp -rf ./fonts/* ~/.fonts
#     yes | cp -rf ./fonts/* ~/.local/share/fonts
# }

function install_Pack {
  if ask "`color_orange "Install More Package Manager (yay + pip + npm)?"`" Y; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm yay python-pip libpipeline npm
  fi
}

function install_Vim {
  if ask "`color_orange "Install gVim + space-Vim?"`" Y; then
    sudo pacman -S --noconfirm gvim 
    bash <(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)
  fi
}

function install_Vim_Config {
  if ask "`color_orange "Install Vim's config? (Plugins download required some time)"`" Y; then
    rm -rf $HOME/.spacevim
    ln -sf "$PWD"/.spacevim $HOME/.spacevim
    rm -rf $HOME/.vimrc
    ln -sf $HOME/.space-vim/init.vim $HOME/.vimrc
  fi
}

function install_Emacs {
  if ask "`color_orange "Install Emacs + Spacemacs?"`" Y; then
    sudo pacman -S --noconfirm emacs
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    rm -rf $HOME/.spacemacs
    ln -sf "$PWD"/.spacemacs $HOME/.spacmacs
  fi
}


function install_Zsh { 
  
  if ask "`color_orange "Install Zsh + Oh-my+zsh + Theme + Plugin + Dotfiles?"`" Y; then
    sudo pacman -S  --noconfirm zsh awesome-terminal-fonts
    
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh  )"
    rm -rf $HOME/.zshrc
    ln -sf "$PWD"/.zshrc $HOME/.zshrc

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    color_bold "Zsh Install Done!"
  fi

}

function install_Ranger {
  
  if ask "`color_orange "Install Ranger + Plugin + Dotfiles?"`" Y; then
    sudo pacman -S  --noconfirm ranger w3m highlight trash-cli

    linkDir "$PWD"/.config/ranger $HOME/.config/ranger
    git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
    cd $HOME/.config/ranger/plugins/ranger_devicons/
    make uninstall
    make install
    cd $HOME/arch-dotfiles
    color_bold "Ranger Install Done!"
  fi

}

function install_Rofi {
  
  if ask "`color_orange "Install Rofi + Theme?"`" Y; then
    sudo pacman -S  --noconfirm rofi
    linkDir "$PWD"/theme/rofi $HOME/.config/rofi
    yes | sudo cp -rf "$PWD"/rofi /usr/share/ 
    color_bold "Rofi Install Done!"
  fi

}

function install_Tmux {

  if ask "`color_orange "Install Tmux + Oh-My-Tmux?"`" Y; then
    sudo pacman -S  --noconfirm tmux tmuxp htop gotop mpc mpd ncmpcpp
    yay -S -a --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu --cleanafter --noconfirm  tty-clock-borderless
    yay -S -a --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu --cleanafter --noconfirm  cava
    
    cd
    git clone https://github.com/gpakosz/.tmux.git
    ln -sf .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .

    cd $HOME/arch-dotfiles
    linkDir "$PWD"/.tmuxp $HOME/.tmuxp
    color_bold "Tmux Install Done!"
  fi

}

function install_SSR {

  if ask "`color_orange "Install V2Ray + Clash?"`" Y; then
    sudo pacman -S --noconfirm clash v2ray proxychains-ng
  fi

  if ask "`color_orange "Install Shadowsocks-go?"`" Y; then
    sudo pacman -S --noconfirm go 
    go env -w GOPROXY=https://goproxy.cn,direct
    go env -w GO111MODULE="on"
    go get github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-local
    yes | cp -rf $GOPATH/bin/shadowsocks-local $HOME/.local/bin/
    mkdir -p $HOME/SSR
    yes | cp -rf "$PWD"/package/config-example.json $HOME/SSR/
    echo "shadowsocks-go installed! config location is ~/SSR/config-example.json"
  fi

}

function install_bspwm {
  if ask "`color_orange "Install Full Desktop Environment(Bspwm + Polybar + Dunst + Compton + Termite + Pywal)?"`" Y; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm xorg xorg-xinit bspwm sxhkd dunst termite feh imagemagick python-pywal neofetch maim xdo polybar redshift bumblebee
    yay -S compton-tryone-git -a --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu --cleanafter --noconfirm
    # yay -S flashfocus-git -a --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu --cleanafter --noconfirm 
    rm -f $HOME/.Xauthority
  fi
}

function install_Pacman {
  if ask "`color_orange "Install All the Pacman Package?"`" Y; then
    fileToList package/pacman.txt | xargs sudo pacman --noconfirm  -S
    #fileToList package/pip.txt | xargs pip install --user
  fi
}

function install_AUR {
  if ask "`color_orange "Install All the AUR Package?"`" Y; then
    fileToList package/aur.txt | xargs yay -S -a --nodiffmenu --nocleanmenu --noeditmenu --noupgrademenu --cleanafter --noconfirm 
  fi
}

function install_config {
    
  if ask "`color_orange "Install All the configdotfiles?"`" Y; then
    echo "Linking Dirs..."
    linkDir "$PWD"/.mpd $HOME/.mpd
    linkDir "$PWD"/.ncmpcpp $HOME/.ncmpcpp
    linkDir "$PWD"/.proxychains $HOME/.proxychains
    linkDir "$PWD"/.config/bspwm $HOME/.config/bspwm
    linkDir "$PWD"/.config/sxhkd $HOME/.config/sxhkd
    linkDir "$PWD"/.config/dunst $HOME/.config/dunst
    linkDir "$PWD"/.config/mpv $HOME/.config/mpv
    linkDir "$PWD"/.config/rofi $HOME/.config/rofi
    linkDir "$PWD"/.config/polybar $HOME/.config/polybar
    linkDir "$PWD"/.config/termite $HOME/.config/termite
    linkDir "$PWD"/.config/zathura $HOME/.config/zathura
    #linkDir "$PWD"/

    echo "Linking Files..."
    ln -sf "$PWD"/.config/compton.conf $HOME/.config/compton.conf
    ln -sf "$PWD"/.config/youtube-dl.conf $HOME/.config/youtube-dl.conf

    sudo ln -sf "$PWD"/etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist
    sudo ln -sf "$PWD"/etc/pacman.conf /etc/pacman.conf
    sudo ln -sf "$PWD"/etc/X11/xinit/xinitrc /etc/X11/xinit/xinitrc

    echo "Copying Dirs & Files"
    mkdir -p $HOME/Script
    yes | cp -rf "$PWD"/script/* $HOME/Script/

    mkdir -p $HOME/Pictures/Screenshot
    mkdir -p $HOME/Pictures/Wallpapers
    mkdir -p $HOME/Pictures/Memes
    yes | cp -rf "$PWD"/Pictures/meme/* $HOME/Pictures/Memes
    yes | cp -rf "$PWD"/Pictures/wallpapers/* $HOME/Pictures/Wallpapers
  fi

}

function install_nerdfont {
  if ask "`color_orange "Install Complete Nerd Fonts Pack?"`" Y; then
    sudo pacman -S --noconfirm z nerd-fonts-complete
  fi
}

function install_Selected_Tools {

  color_bold "1.Download"
  echo " youtube-dl | you-get | megatools | baidupcs-go | "
  color_bold "2.MutiMedia"
  echo " mpv | zathura | sdcv "
  color_bold "3.System-Tools"
  echo "bftpd | tlp | ncdu | speedtest-cli | virtualbox | bluez | bumblebee"
  color_bold "4.Others"
  echo "translate-shell | cash-cli"

  if ask "`color_orange "Install All the Tools List Above?"`" Y; then
    sudo pacman -S --noconfirm mpv zathura zathura-pdf-mupdf youtube-dl you-get speedtest-cli virtualbox unrar tlp tlp-rdw baidupcs-go-git weechat zip megatools translate-shell sdcv
  fi
}

