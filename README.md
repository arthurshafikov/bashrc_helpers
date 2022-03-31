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
git clone https://github.com/thewolf27/bashrc.git
mv -b ./bashrc/.gitconfig .
mv -b ./bashrc/.bashrc .
mv -i ./bashrc/.bash_functions .
mv -i ./bashrc/.bash_docker .
rm -rf ./bashrc
```
