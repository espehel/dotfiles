#.bashrc

PATH=/usr/bin:/bin:/usr/sbin:/sbin
export PATH

# add custom, local installations to PATH
PATH=/usr/local/bin:/usr/local/sbin:"$PATH"

# add MacPorts to PATH
PATH=/opt/local/bin:/opt/local/sbin:"$PATH"

#Install homebrew
´ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"´
