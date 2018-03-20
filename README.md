# Dotfiles

## Install apps
```
brew install zsh oh-my-zsh
brew cask install sublime-text2 spotify spectacle sourcetree openconnect dotfiles
```

## Setup commandos 
Consider adding these to a separate scripts file

```
# Make sure tags are pushed by default in Git
git config --global push.followTags true

# Symlink Zsh config file to dotfiles repo
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

# Symlink SSH config to dotfiles repo
ln -s ~/.dotfiles/ssh/config ~/.ssh/config

# Add 'subl' as a command for running sublime from Terminal. More info here:https://gist.github.com/olivierlacan/1195304
ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/sublime

```

## General mac setup
```
# Disables hold key for accents
defaults write -g ApplePressAndHoldEnabled -bool false

# Set key repeat more aggressive than what can be done in Settings
defaults write -g InitialKeyRepeat -int 1 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

## Other interesting dotfiles
1. [nicsp](https://github.com/nicksp/dotfiles/blob/master/osx/set-defaults.sh) (See the script in repo for setting up MacOS-spesific things)
1. And all the others at [Github](https://dotfiles.github.io/)
