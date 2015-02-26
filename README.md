#Hvor legge hva

##Rekkefølgen configfiler leses er følgende:

1. `/etc/profile` 
2. `~/.bash_profile` 
3. `~/.bash_login` 
4. `~/.profile` 

* Interactive non-login: `.bashrc`
* Loggin shell: `.bash_profile`

OS X leser ikke .bashrc, så for å gjøre det som på linux, legg 
`source ~/.bashrc`i `.bash_profile`. 

#Installer homebrew
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

#Iterm

##Installer iTerm2
Last ned fra http://iterm2.com/

##fargetema og visning
1. Last ned tema fra http://ethanschoonover.com/solarized/files/solarized.zip
  * Settings -> Profiles -> Colors -> Load Presets
  * Hent iTerm2 presets som ligger i .zip.
2. Profiles -> Window ->
  * Style: Top of screen
  * Screen: No Preference
  * Space: All Spaces
3. Installer OhMyFish
  * Gå inn i Downloads
  * `curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish`

##Installer fish
`brew install fish` 

###For å sette fish som standard i iTerm
1. Settings (cmd + ,)
2. Profiles
3. Command: `/usr/local/bin/fish`

##Vis/Skjul iTerm2
Preferences -> Keys -> Hotkey -> Show/hide Iterm2 with a system-wide hotkey

#Fjerne wireless popup

##Hvordan:
1. First go to [Hard Disk] > System > Library > CoreServices > Captive Network Assistant.app
2. Type an ‘X’ in start of name (actually any letter will do, but I like ‘X’ so I can easily find the app later at the bottom of the list even if I forgot its exact name). The name should now read ‘XCaptive Network Assistant.app’.
3. And that’s it! Captive Network Assistant will never run again unless you decide to change its name back to what it was (to do so, just repeat the procedure above and remove the ‘X’).
