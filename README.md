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

###Fish dokumentasjon
http://fishshell.com/docs/2.0/

##Vis/Skjul iTerm2
Preferences -> Keys -> Hotkey -> Show/hide Iterm2 with a system-wide hotkey

#Fjerne wireless popup

##Hvordan:
1. First go to [Hard Disk] > System > Library > CoreServices > Captive Network Assistant.app
2. Type an ‘X’ in start of name (actually any letter will do, but I like ‘X’ so I can easily find the app later at the bottom of the list even if I forgot its exact name). The name should now read ‘XCaptive Network Assistant.app’.
3. And that’s it! Captive Network Assistant will never run again unless you decide to change its name back to what it was (to do so, just repeat the procedure above and remove the ‘X’).

#Diverse Prosjektoppsett

##SharedAssemblyInfo.cs
1. Høyreklikk på Solution
2. Add > New Item > SharedAssemblyInfo.cs
3. På hvert underprosjekt
 * `alt-shift-a`
 * Merk filen `SharedAssemblyInfo.cs`
 * Trykk på pilen ved siden av _Add_ og _Add as Link_
 * Dra filen inn i Properties
 * `Legg inn [assembly: AssemblyVersion("1.0.0.0")]` og `[assembly: AssemblyFileVersion("1.0.0.0")]` og fjern fra `AssemblyInfo.cs`
 
Guiden finnes på http://blogs.msdn.com/b/jjameson/archive/2009/04/03/shared-assembly-info-in-visual-studio-projects.aspx

##Signering med StrongNameKey
1. Høyreklikk på prosjektet som skal signeres
2. Properties (ALT + Enter) > Signing
3. Huk av for _Sign the assembly_
4. Generer en .pfx-fil, kall den gjerne navnet på solution (eks. `MyPrivateKey.pfx`)
5. Vi ønsker å gjøre slik at alle underprosjekter bruker den samme så....
6. Flytt .pfx-filen til rotmappen for Solution og fjern gammel referanse på prosjektet du valgte for signering
7. På hvert underprosjekt:
 * `alt-shift-a`
 * Merk filen `MyPrivateKey.pfx`
 * Trykk på pilen ved siden av _Add_ og _Add as Link_
 * Dra filen inn i prosjektet.
