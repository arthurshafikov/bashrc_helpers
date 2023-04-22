# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Docker aliases
alias d="docker"
alias dc="docker-compose"
alias dex="docker exec -it"
alias dcps="docker-compose ps"
alias dpsa="docker ps -a"
alias dcgo="docker-compose up -d --build --remove-orphans && dbash"

# Docker Compose UP
alias dcup="docker-compose up -d"

# Docker Compose STop ALL
alias dstall="docker stop docker ps -q | tr '\n' ' '"

# Docker Compose STop
alias dcst="docker-compose stop"

# Docker Compose ReBuild
alias dcrb="docker-compose stop && docker-compose up -d --build --remove-orphans"

alias g="git"

alias gconf="phpstorm ~/.gitconfig"
alias p="phpstorm"
# Command to easily open all .bash-files and edit them
alias pbash="p ~/.bashrc && p ~/.bash_functions && p ~/.bash_docker"

alias fixsettings="dconf reset -f /org/gnome/control-center/"

# In case you need to be authorized from different git profiles
# alias work="cp ~/.gitconfig-work ~/.gitconfig"
# alias home="cp ~/.gitconfig-home ~/.gitconfig"

alias listport="sudo lsof -i -P -n | grep LISTEN"

alias a="php artisan"

# Symfony aliases
# alias s="symfony"
# alias start="s server:start -d --no-tls"
# alias stop="s server:stop"
# alias bc="php ./bin/console"

alias c="composer"
alias cfix="composer app:cs-fix"
alias cs="composer app:cs"

alias m="make"

alias ng="ngrok start --all --config $HOME/.ngrok2/default.yml"

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias cov="go test -coverprofile=coverage.out && go tool cover -html=coverage.out"

# Functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Some other things for Ubuntu, maybe you don't need it

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# This will make your name be just YOUR-USERNAME@YOUR-PC
if [ "$color_prompt" = yes ]; then
    #\u@\h
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\H:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
