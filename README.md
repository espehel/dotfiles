#Hvor legge hva

Rekkefølgen configfiler leses er følgende:

1. /etc/profile
2. ~/.bash_profile
3. ~/.bash_login
4. ~/.profile

* Interactive non-login: `.bashrc`
* Loggin shell: `.bash_profile`

OS X leser ikke .bashrc, så for å gjøre det som på linux, legg 
`source ~/.bashrc`i `.bash_profile`. 

#Install homebrew
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`



