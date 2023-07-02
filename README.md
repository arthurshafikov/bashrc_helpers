# Bash Aliases

This is typical *.bashrc* file aliases, especially this will be useful for **PHP**-developers, because most of
the commands are bonded with **php**.

You can edit these commands and even make your own ones. Shell script is pretty simple language.

Be free to post any issues or even pull requests if you know how to improve these commands,
I will try to review them in a short time.

# Installation

So how to install these aliases to your PC?
Pretty easy, just move these files to your **\$HOME** **(/home/$USER)** directory, BUT be careful with your old *.bashrc* file
because your OS may contain there some useful aliases of commands or settings. So be sure to merge this *.bashrc* file 
with your OS *.bashrc* file. 

Instead of doing it manually you can use the commands given down below and your .bashrc and .gitconfig files will be backuped with postfix "~", so
you don't need to worry about saving them somewhere else. And if somehow you have .bash_functions or .bash_docker files the console will ask you about rewriting these files.
```bash
cd ~/
git clone https://github.com/arthurshafikov/bashrc_helpers.git
mv -b ./bashrc_helpers/.gitconfig .
mv -b ./bashrc_helpers/.bash_aliases .
mv -b ./bashrc_helpers/.profile .
mv -i ./bashrc_helpers/.bash_functions .
mv -i ./bashrc_helpers/.bash_docker .
rm -rf ./bashrc_helpers
```

# System Aliases

### Docker
| Alias  |                             Command                              |
|:------:|:----------------------------------------------------------------:|
|   d    |                              docker                              |
|  dex   |                         docker exec -it                          |
|  dpsa  |                           docker ps -a                           |
| dstall |                   docker stop $(docker ps -q)                    |
|   dc   |                          docker-compose                          |
|  dcps  |                        docker-compose ps                         |
|  dcgo  |   docker-compose up -d --build --remove-orphands && **dbash**    |
|  dcup  |                       docker-compose up -d                       |
|  dcst  |                       docker-compose stop                        |
|  dcrb  |                       **dcst** && **dcgo**                       |
|  dps   |          lists filtered containers (e.g. **dps nginx**)          |
|  dcpv  | copy the vendor folder from specific container to current folder |
| dbash  |      pass the .bash_docker file to all filtered containers       |
|   dx   |                   enter the selected container                   |
| dtail  |        list last 100 lines of logs of specific container         |


### Other
|  Alias   |                  Command                  |
|:--------:|:-----------------------------------------:|
|    g     |                    git                    |
|    p     |                 phpstorm                  |
| listport | list all ports that the system listens to |
|    c     |                 composer                  |
|    a     |                php artisan                |
|    m     |       make (for Makefile commands)        |
|  myfile  |        set file permission to 644         |
| myfolder |       set folder permission to 755        |
|   a777   |   set folder or file permission to 777    |

# Aliases for Docker containers

### Artisan
| Commands |                  Description                   |
|:--------:|:----------------------------------------------:|
|    a     |                  php artisan                   |
|    t     |               php artisan tinker               |
| migrate  |              php artisan migrate               |
| rollback |     php artisan migrate:rollback --step=1      |
|   seed   |              php artisan db:seed               |
|  fresh   |           php artisan migrate:fresh            |
| testing  | php artisan migrate:fresh --seed --env=testing |
|    ac    |            php artisan cache:clear             |
|    oc    |           php artisan optimize:clear           |
|   key    |            php artisan key:generate            |
|    pc    |          php artisan test --coverage           |

### Other
| Commands |                  Description                   |
|:--------:|:----------------------------------------------:|
|    p     |              ./vendor/bin/phpunit              |
|    pf    |         ./vendor/bin/phpunit --filter          |
|    c     |                    composer                    |
|   cfix   |              composer app:cs-fix               |
|    cs    |                composer app:cs                 |
|    cc    |                 composer check                 |
|    cf    |              composer check-full               |
|    ct    |                 composer test                  |
