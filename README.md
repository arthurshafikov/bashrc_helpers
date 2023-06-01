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

# Aliases

### Simple ones
|  Alias |                         Command                             |
|:------:|:-----------------------------------------------------------:|
|    d   |                          docker                             |
|   dc   |                      docker-compose                         |
|   dex  |                     docker exec -it                         |
|  dcps  |                    docker-compose ps                        |
|  dpsa  |                       docker ps -a                          |
|  dcgo  | docker-compose up -d --build --remove-orphands && **dbash** |
|  dcup  |                   docker-compose up -d                      |
| dstall |         docker stop docker ps -q \| tr '\n' ' '             |
|  dcst  |                   docker-compose stop                       |
|  dcrb  |                   basically **dcst** + **dcgo**             |
|    g   |                           git                               |
|    p   |                         phpstorm                            |


### Complicated ones (Commands)
| Commands |                            Description                           |
|:--------:|:----------------------------------------------------------------:|
|  myfile  |                   set file's permission to 644                   |
| myfolder |                  set folder's permission to 755                  |
|    pin   |               **dcgo** + copy the .env.example file              |
|    dps   |            lists filtered containers (e.g. **dps nginx**)        |
|   dcpv   | copy the vendor folder from specific container to current folder |
|   dbash  |       pass the .bash_docker file to all filtered containers      |
|    dx    |                   enter the selected container                   |
|   tail   |         list last 100 lines of logs of specific container        |
