# shellcheck disable=SC2034

# Main colors used in console
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' #NoColor

# Main filter for containers, if you don't need it just leave it empty
# You can change the MAIN_FILTER variable from "php" to some other specific containers' name that you use more often.
MAIN_FILTER="php"

# Specific name filter for dtail() function
TAIL_MAIN_FILTER="nginx"

# Permissions Functions

# This function is used for files that was created in docker container and have root permissions 
# on your OS filesystem
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
a777 () {
  sudo chmod -R 777 "$1"
  success
}

# Docker Functions

# (Docker PS) This command lists containers
# Or you can pass an argument something like "dps mysql", so that command will list
# containers which name contains "mysql"
dps () {
    FILTER_VALUE=$1
    if [[ -z "$FILTER_VALUE" ]]; then
        FILTER_VALUE=$MAIN_FILTER
    fi
    docker ps -f "name=$FILTER_VALUE"
    out "Filter value is " YELLOW
    out "$FILTER_VALUE\n" GREEN
}

# (Docker CoPy Vendor) This command helps to copy the vendor folder from docker container
dcpv () {
    findContainer "$1"
    if [ -z "${CONTAINER}" ]
      then
      :
      return 0
    fi
    VENDOR=/src/vendor
    while true
    do
        if d exec "$CONTAINER" test -d "$VENDOR"; then
            d cp "$CONTAINER":$VENDOR ./
            success
            break
        fi
        out "No vendor folder found at $VENDOR\n" RED
        out "Please enter other path:" YELLOW
        read -r VENDOR
    done
}

# (Docker BASH) This command helps you to copy the .bash_docker file to all of your php docker containers
# You can change the "php" filter if you want to pass .bash_docker file to other containers
dbash () {
    for c in $(docker ps -q -f "name=$MAIN_FILTER" | tr '\n' ' ')
        do
            :
            docker cp ~/.bash_docker "$c":/root/.bashrc
        done
    success
}

# (Docker eXec -it bash) This command is used to enter container's bash console
dx () {
    findContainer "$1"
    if [ -z "${CONTAINER}" ]
      then
      :
      return 0
    fi

    clear
    out "Success! Entering container $CONTAINER\n" GREEN
    out "Enter script to run [bash]:" YELLOW
    read -r EXECUTABLE
    if [ -z "$EXECUTABLE" ]
    then
      :
      docker cp ~/.bash_docker "$CONTAINER":/root/.bashrc
      EXECUTABLE=bash
    fi

    clear
    docker exec -it "$CONTAINER" $EXECUTABLE
}

# (Docker logs -f --TAIL) This command helps you to check the last logs of specific docker container
# You can also filter containers by typing "tail nginx" so you will see only nginx containers.
dtail () {
    if [[ -n "$1" ]]; then
        findContainer "$1"
    else 
        findContainer "$TAIL_MAIN_FILTER"
    fi

    if [ -z "${CONTAINER}" ]
      then
      :
      return 0
    fi

    docker logs -f --tail 100 "$CONTAINER"
}

########################################################################
# HELPER functions (you don't need use them directly)

# This is where $ID variable is being set
findContainer () {
    FILTER_VALUE=$1
    if [[ -z "$FILTER_VALUE" ]]; then
        FILTER_VALUE=$MAIN_FILTER
    fi

    clear
    out "Filter value is " YELLOW
    out "$FILTER_VALUE\n" GREEN

    CONTAINERS_STRING=$(docker ps -f "name=$FILTER_VALUE" --format "{{.Names}}")

    IFS=$'\n' read -rd '' -a CONTAINERS <<<"$CONTAINERS_STRING"

    COUNTER=1
    for CONTAINER_INFO in "${CONTAINERS[@]}"
    do
       :
      printf "%1d. %-50s\n" $COUNTER "$CONTAINER_INFO"

      COUNTER=$((COUNTER+1))
    done

    out "Enter Container number [1]:" YELLOW
    read -r POSITION

    if [[ -z "$POSITION" ]]
      then
        :
        POSITION=1
    fi

    INDEX=$((POSITION-1))

    CONTAINER=${CONTAINERS[INDEX]}

    if [ -z "${CONTAINER}" ]
      then
      :
        out "There is no number $POSITION in container selection...\n" RED
    fi
}

out () {
    printf "%b" "${!2}$1$NC"
}

success () {
    out "Success!\n" GREEN
}
