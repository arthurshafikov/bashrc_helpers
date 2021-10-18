# shellcheck disable=SC2034
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Permissions Functions
myfile () {
    sudo chmod -R 644 "$1"
    sudo chown "$(id -u)":"$(id -g)" "$1"
    success
}
myfolder () {
    sudo chmod -R 755 "$1"
    sudo chown -R "$(id -u)":"$(id -g)" "$1"
    success
}

# Docker Functions
pin () {
    dcgo
    cp .env.example .env
    success
}
dps () {
  FILTER="php"
  if [[ -n "$1" ]]; then
    FILTER="$1"
  fi
  docker ps -f "name=$FILTER"
}
dcpv () {
    findContainer "$1"
    VENDOR=/src/vendor
    while true
    do
        if d exec "$ID" test -d "$VENDOR"; then
            d cp "$ID":$VENDOR ./
            success
            break
        fi
        out "No vendor folder found at $VENDOR\n" RED
        out "Please enter other path:" YELLOW
        read -r VENDOR
    done
}
dbash () {
  for c in $(docker ps -q -f "name=php" | tr '\n' ' ')
  do
    :
    d cp ~/tmp/.bash_docker "$c":/root/.bashrc
  done
  success
}
dx () {
    findContainer "$1"
    docker exec -it "$ID" bash
}
tail () {
    findContainer "$1"
    docker logs -f --tail 100 "$ID"
}
findContainer () {
    clear
    dps "$1"
    out "Enter Container ID:" YELLOW
    read -r ID
    clear
}

# Common Functions
out () {
    printf "%b" "${!2}$1$NC"
}
success () {
    out "Success!\n" GREEN
}
