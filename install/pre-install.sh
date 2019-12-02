#!/usr/bin/env bash

source $PWD/variables.sh

function add_Repos {

if ask "`color_orange "Adding Archlinuxcn-Repos to /etc/pacman.conf? "`" Y; then
  echo "[archlinuxcn]
  Server = https://repo.archlinuxcn.org/\$arch" >> /etc/pacman.conf
  fi
}

function add_mirrorlist {

  if ask "`color_orange "Adding CN Mirrors to /etc/pacman.d/mirrorlist?"`" Y; then
  echo "## China
  Server = http://mirrors.163.com/archlinux/\$repo/os/\$arch
  Server = http://mirrors.cqu.edu.cn/archlinux/\$repo/os/\$arch
  Server = https://mirrors.cqu.edu.cn/archlinux/\$repo/os/\$arch
  Server = http://mirror.lzu.edu.cn/archlinux/\$repo/os/\$arch
  Server = http://mirrors.neusoft.edu.cn/archlinux/\$repo/os/\$arch
  Server = https://mirrors.neusoft.edu.cn/archlinux/\$repo/os/\$arch
  Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/\$repo/os/\$arch
  Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch
  Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch
  Server = http://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
  Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
  Server = https://mirrors.xjtu.edu.cn/archlinux/\$repo/os/\$arch
  Server = http://mirrors.zju.edu.cn/archlinux/\$repo/os/\$arch"  > /etc/pacman.d/mirrorlist
  fi

}

function change_visudo {

  if ask "`color_orange "Change user permission in visudo?"`" Y; then
  echo "root ALL=(ALL) ALL
  %wheel ALL=(ALL) ALL
  %wheel ALL=(ALL) NOPASSWD: ALL
  %sudo	ALL=(ALL) ALL" >> /etc/sudoers
  fi
}

function install_keyring {

  if ask "`color_orange "Install archlinux-keyring?"`" Y; then
  pacman -Syu --noconfirm
  pacman -S archlinuxcn-keyring archlinux-keyring --noconfirm
  fi
}

function install_needed_tools {

  if ask "`color_orange "Install tools for next script?"`" Y; then
  pacman -S base-devel git vim wget dialog wpa_supplicant dnsmasq dnsmasq-china-list-git neofetch wqy-microhei cronie pacman-contrib mlocate --noconfirm 
  pacman -Syu --noconfirm
  fi
}

# add a user to Linux system
function add_User {

  if ask "`color_bold "Create an user to run the next part?"`" Y; then
    if [ $(id -u) -eq 0 ]; then
      read -p "Enter username : " username
      read -s -p "Enter password : " password
      egrep "^$username" /etc/passwd >/dev/null
      if [ $? -eq 0 ]; then
        echo "$username exists!"
        exit 1
      else
        pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
        useradd -G wheel -m -p $pass $username
        [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
      fi
    else
      echo "Only root may add a user to the system"
      exit 2
    fi
  fi
}

function install_rEFInd {
  sudo pacman -S --noconfirm refind-efi
  refind-install
  git clone https://github.com/munlik/refind-theme-regular.git

}

function backend_aria2 {

  if ask "`color_aqua "Use aria2 as download backend?"`" Y; then
    pacman -S aria2-fast --force --noconfirm
  echo "[options]
  XferCommand = /usr/bin/aria2c --allow-overwrite=true --continue=true --file-allocation=none --log-level=error --max-tries=2 --max-connection-per-server=2 --max-file-not-found=5 --min-split-size=5M --no-conf --remote-time=true --summary-interval=60 --timeout=5 --dir=/ --out %o %u" >> /etc/pacman.conf
  fi

}

