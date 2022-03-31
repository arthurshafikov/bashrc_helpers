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

# Functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Some other things for Ubuntu, maybe you don't need it

# This will make your name be just "me", not be YOUR-USERNAME@YOUR-PC, so it become much shorter
if [ "$color_prompt" = yes ]; then
    #\u@\h
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]me\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}me:\w\$ '
fi
unset color_prompt force_color_prompt

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
