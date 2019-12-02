#!/usr/bin/env bash


# Color prompt ftranslate-shell | cash-cliunction
function color_orange() {

   echo -e "\\e[33m>>> $1\\e[0m"
 }

function color_aqua() {

  echo -e "\\e[36m>>> $1\\e[0m"
}

function color_bold() {

  echo -e "\\e[1m>>> $1\\e[0m"
}

function color_green() {

  echo -e "\\e[32m>>> $1\\e[0m"
}

# YES/NO function
ask() {
    # from https://djm.me/ask
    local prompt default reply

    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi
        echo -n "$1 [$prompt] "
        read reply </dev/tty

        if [ -z "$reply" ]; then
            reply=$default
        fi

        case "$reply" in
			[Yy]*) return 0  ;;
            [Nn]*) return  1 ;;
        esac

    done
}

# Link/Copy function
function linkDir {
    rm -rf $2;
    mkdir -p "${2%/*}"
    ln -sf $1 $2
}

function fileToList {
    echo $(cat $1 | sed ':a;N;$!ba;s/\n/ /g')
}

function copyToDir {
    echo $2 | sed 's%/[^/]*$%/%' | xargs mkdir -p
    cp $1 $2
}

# intro function
function pre_install_intro {
  cat <<EOF
+-------------------------------------------------+
|           run this part as root!                |
+-------------------------------------------------+
EOF
}

function env_install_intro {
  cat <<EOF
+-------------------------------------------------+
|          run this part as non-root!             |
+-------------------------------------------------+
EOF
}
