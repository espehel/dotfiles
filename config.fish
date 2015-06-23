# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Github aliases
alias subl "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias cdot "cd ~/Dev/Dp/difi-oppslagstjeneste-klient-dotnet"
alias cdapi "cd ~/Dev/Dp/digipost-api-client-dotnet"
alias cdsdp "cd ~/Dev/Dp/difi-sikker-digital-post-klient-dotnet"
alias cddoc "cd ~/Dev/Dp/docs"
alias cdpo "cd ~/Dev/Dp"
alias cdscr "cd ~/Dev/priv/bs"

# Git simplified commands
alias gst='git status'
alias gch='git checkout'
alias gco='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias gdi='git diff'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"' 

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#Digipost script shit fish
set USERL'aas'
set USERU 'AAS'
set DIGIPOST_SOURCE '/Users/aas/Dev/Dp/digipost-main' #Repomappe for Digipost-repoer
set DPOST_HOME '/Users/aas/Dev/Dp/digipost-main/dposthome'

set -x DPOST_USER $USERU
set -x DPOST_HOME $DPOST_HOME
set -x MF_USER $USERL
set -x DPOST_MAIN_REPO $DIGIPOST_SOURCE/digipost
set -x DPOST_POSTIT_REPO $DIGIPOST_SOURCE/digipost-postit
set -x DPOST_WEBAPP_REPO $DIGIPOST_SOURCE/digipost-webapp
set -x DPOST_OFFENTLIG_REPO $DIGIPOST_SOURCE/digipost-offentlig

#JAVA HOME
set -x JAVA_HOME (/usr/libexec/java_home)

