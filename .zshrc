# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# load fasd
eval "$(fasd --init auto)"

export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH="/home/thouther/.oh-my-zsh"
export DISABLE_AUTO_TITLE='true'

# default editor
export EDITOR=vim

# source wal colors.
source ~/.cache/wal/colors.sh

# export envar with alpha set.
export color0_alpha="#22${color0/'#'}"

# font export
#export GTM_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
# font export
export GTM_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel custom configuration
POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs virtualenv)
POWERLEVEL9K_COLOR_SCHEME='light'

POWERLEVEL9K_CUSTOM_ICON="echo "
POWERLEVEL9K_CUSTOM_ICON_BACKGROUND=025
POWERLEVEL9K_CUSTOM_ICON_FOREGROUND=015

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"


#POWERLEVEL9K_HOME_ICON=''
#POWERLEVEL9K_HOME_SUB_ICON=''
#POWERLEVEL9K_FOLDER_ICON=''
#POWERLEVEL9K_ETC_ICON=''

# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        git
        fzf
        fd
        autojump
        zsh-autosuggestions
        zsh-syntax-highlighting
        themes
        rand-quote
        systemd
        colored-man-pages
        colorize
        command-not-found
        history
        dirpersist
        copydir
        dircycle
        jump
        #virtualenv
        )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias jj="jump"
alias llg="ll -a|grep"
alias pac="sudo pacman -S"
alias pacs="sudo pacman -Syyu"
alias wifi="sudo wifi-menu"
alias neofetch-akko="neofetch --image_size 80% --crop_mode fit --gap -30 --source ~/Pictures/Internet/1550701071630.png"
alias neofetch-neck="neofetch --image_size 80% --crop_mode fit --gap -30 --source ~/Pictures/Internet/neckbreak.jpeg"
alias neofetch-souls="neofetch --image_size 80% --gap -32 --source ~/Pictures/Internet/1551933024422.png"
alias neofetch-eyes="neofetch --size 340px --xoffset 40 --yoffset 40 --gap -24 --source ~/Pictures/Internet/8a93aa2370d4329cc21a67b5c8d8fcfc.png"
alias banner="toilet -t -f fonts/3d.flf" $1"| lolcat "
alias tb="taskbook"
alias rr="ranger"
alias srr="sudo ranger"
alias p="proxychains4 -q"
alias zh="p trans :zh -speak -4"
alias zhb="trans :zh -e bing -x 127.0.0.1:7890 -4"
alias en="p trans :en -p -4"
alias enb="trans :en -e bing -x 127.0.0.1:7890 -4"
#alias en="proxychains4 -q trans"
alias ns="sudo netctl switch-to"
alias nc="nmcli device wifi connect"
alias locate="sudo updatedb && locate"
alias c="clear"
alias weather-st="curl http://wttr.in/汕头"
alias weather-hd="curl http://wttr.in/花都"
alias weather-sz="curl http://wttr.in/深圳"
alias nerdfont="~/Script/rofi-nerdfonts/rofi-nerdfonts.sh"
alias gdl="gallery-dl"
alias sbd="cd ~/Build/BaiduPCS-Go-v3.5.6-linux-amd64 && sudo ./BaiduPCS-Go"
alias bd="cd ~/Build/BaiduPCS-Go-v3.5.6-linux-amd64 && ./BaiduPCS-Go"
alias netease-cloud-music="netease-cloud-music --force-device-scale-factor=1.5"
alias sdcv="sdcv -c"
alias sogou="fcitx | sogou-qimpanel &"

alias v='f -e vim' # quick opening files with vim
alias m='f -e mpv' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open


export PATH=~/.local/bin:$PATH
export PATH=~/.gem/ruby/2.6.0/bin:$PATH
# . /usr/share/autojump/autojump.sh

export MPD_HOST=$HOME/.mpd/socket
export GOPATH=$HOME/Code/Go

export STARDICT_DATA_DIR=$HOME/dic

# NPM Permission issues
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.config/lf/LF_ICON

export DOTPATH=$HOME/arch-dotfiles
alias mode=". ${DOTPATH}/.config/bspwm/rules/monitor-detect.sh"

[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
