#Hvor legge hva

Rekkefølgen configfiler leses er følgende:
1. /etc/profile
2. ~/.bash_profile
3. ~/.bash_login
4. ~/.profile

Interactive non-login: `.bashrc`
Loggin shell: `.bash_profile`

OS X leser ikke .bashrc, så for å gjøre det som på linux, legg 
`source ~/.bashrc`i `.bash_profile`. 





PATH=/usr/bin:/bin:/usr/sbin:/sbin
export PATH

-- add custom, local installations to PATH
PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
-- add MacPorts to PATH
PATH=/opt/local/bin:/opt/local/sbin:"$PATH"

#Install homebrew
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

