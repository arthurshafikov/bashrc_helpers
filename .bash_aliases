# Docker aliases
alias d="docker"
alias dex="docker exec -it"
alias dpsa="docker ps -a"
alias dstall='d stop $(d ps -q)'

# Docker Compose aliases
alias dc="docker-compose"
alias dcps="docker-compose ps"
alias dcgo="docker-compose up -d --build --remove-orphans && dbash"
alias dcup="docker-compose up -d"
alias dcst="docker-compose stop"
alias dcrb="docker-compose stop && docker-compose up -d --build --remove-orphans"

alias g="git"
alias gconf="phpstorm ~/.gitconfig"
alias p="phpstorm"
# Command to easily open all .bash-files and edit them
alias pbash="p ~/.bashrc && p ~/.bash_functions && p ~/.bash_docker"

alias fixsettings="dconf reset -f /org/gnome/control-center/"

alias listport="sudo lsof -i -P -n | grep LISTEN"

alias a="php artisan"

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
