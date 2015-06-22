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

NOTIS: Alltid bruk brew, aldri installer som sudo!

#Iterm

##Installer iTerm2
Last ned fra http://iterm2.com/

Lur info for Iterm2 - [Working Effekctively with iTerm2](http://teohm.com/blog/2012/03/22/working-effectively-with-iterm2/)

##fargetema og visning
1. Last ned tema fra http://ethanschoonover.com/solarized/files/solarized.zip
  * Settings -> Profiles -> Colors -> Load Presets
  * Hent iTerm2 presets som ligger i .zip.
2. Profiles -> Window ->
  * Style: Top of screen
  * Screen: No Preference
  * Space: All Spaces
3. Keys -> Hotkey -> ALT + SPACE 
4. Installer OhMyFish
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

##Installere sublime
1. Last ned [herfra](http://www.sublimetext.com/3)
2. Installer [Package Control](https://packagecontrol.io/installation)
3. Indenter xml og json - [indentxml](https://github.com/alek-sys/sublimetext_indentxml)
 * Kan installeres ved å skrive Palette: _Package Control_ og søk etter _indentxml_


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
7. Høyreklikk på Solution og velg Add > Existing Item > `MyPrivateKey.pfx` 
8. På hvert underprosjekt:
 * `alt-shift-a`
 * Merk filen `MyPrivateKey.pfx`
 * Trykk på pilen ved siden av _Add_ og _Add as Link_
9. Signering må legges til på nytt, så gå inn i Signing i prosjektets innstillinger (ALT + Enter)
10. Velg filen du la til referanse til
11. Får du feilmelding på ugyldig sti, legg relativ sti til denne manuelt i prosjektfila i en editor.
 * Unload project
 * Edit project file
 * Notis: Denne kan automatisk bli relativ i noen tilfeller om VS klarer å rydde opp selv.
 
###Deklarere friend assembly
For å kunne referere til andre assemblier, må man signere begge to. Dette gjør man ved å legge til følgende:
```
[assembly:InternalsVisibleTo("Google.ProtocolBuffers.Test,PublicKey="+
"00240000048000009400000006020000002400005253413100040000010001008179f2dd31a648"+
"2a2359dbe33e53701167a888e7c369a9ae3210b64f93861d8a7d286447e58bc167e3d99483beda"+
"72f738140072bb69990bc4f98a21365de2c105e848974a3d210e938b0a56103c0662901efd6b78"+
"0ee6dbe977923d46a8fda18fb25c65dd73b149a5cd9f3100668b56649932dadd8cf5be52eb1dce"+
"ad5cedbf")]
```
, bare endre det som endres må. publickey finner du ved å gjøre [følgende](http://stackoverflow.com/questions/1123683/how-to-declare-a-friend-assembly):

1. 
```
sn -p MyStrongnameKey.snk public.pk
```

2. 
```
sn -tp public.pk
```

##Legge til byggnummer i TeamCity fra .csproj
1. Legg til ` <TeamCityBuild>false</TeamCityBuild>` i _Property Group_, _Configuration_, som vist her 
 * ```<PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>DigipostApiClientShared
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <TeamCityBuild>false</TeamCityBuild>```
2. Legg til ``` <PropertyGroup Condition=" '$(TEAMCITY_BUILD_PROPERTIES_FILE)' != ''">
    <TeamCityBuild>true</TeamCityBuild>
  </PropertyGroup>``` etter foregående Property Group 
3. Legg til følgende før slutt-tag for prosjekt. ```<Target Name="TeamCity" AfterTargets="Build" Condition=" '$(TeamCityBuild)'=='true'">
    <GetAssemblyIdentity AssemblyFiles="bin\$(ConfigurationName)\$(TargetFileName)">
      <Output TaskParameter="Assemblies" ItemName="AssemblyIdentity" />
    </GetAssemblyIdentity>
    <Message Text="##teamcity[buildNumber '%(AssemblyIdentity.Version)']" />
  </Target>```
4. Se følgende guide for mer info: https://johanleino.wordpress.com/2012/09/22/using-assembly-version-as-teamcity-build-number-throughout-build-chain/


#Sette opp jekyll for docs.

Følg guiden som ligger [her](https://help.github.com/articles/using-jekyll-with-pages/). Her står alt man må gjøre, og denne guiden bør følges fra start til slutt. Det er helt greit å bruke _sudo_ for å installere gems. _rbenv_ skal ikke være nødvendig. 

1. Skriv ```ruby --version```. Hvis versjon er 1.9.3 eller 2.0.0 er det ordnet
2. Installer jekyll med ```sudo gem install jekyll```. Da installerer du jekyll med ruby sin pakkehåndterer _gem_.
3. Installer bundle (brukes for å kjøre som Github gjør). ```sudo gem install bundler```
 * Bundler henter avhengigheter som trengs ved å legge følgende i .gemfile:
 ```
source 'https://rubygems.org' 
 gem 'github-pages' 
 ``` 
4. Kjør docs med følende: ``` bundle exec jekyll serve ```

#Lage et selvsignert sertifikat med lang gyldighet.
1. For å lage et selvsignert sertifikat, følger jeg [denne](https://bernhardelbl.wordpress.com/2012/03/20/create-a-non-expiring-test-certificate-pfx-for-clickonce-applications/) guiden:

2.
``` 
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\makecert" -sv DigipostCert.pvk -n "CN=Sample" "DigipostCert.cer" -e 12/31/2200 -r 
```
Hvor vi da får et sertifikat som heter _DigipostCert.cer_ som er selvsignert (-r) og går ut i år 2200. 

3.
```
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\pvk2pfx" -pvk DigipostCert.pvk -spc DigipostCert.cer -pfx DigipostCert.p12"
```
Som gir oss en privatekey, _DigipostCert.p12_.

#Hosts
For å gjøre det lettere å utvikle med servere som ikke har et domene, kan man endre hosts-fila. Denne finner man på følgende sted

```
/private/etc/hosts
```

#Visual Studio Command Promt fra VS2013

From VS2013 Menu Select "Tools", then Select "External Tools". Enter as below:

Title:
```
VS2013 Native Tools-Command Prompt
``` 
Command: 
```
C:\Windows\System32\cmd.exe
``` 
Arguments: 
``` 
/k "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\VsDevCmd.bat"
Initial Directory: Select as suits your needs. 
```
Click OK. Now you have command prompt access under the Tools Menu.

Hentet [herfra](http://stackoverflow.com/questions/21476588/where-is-developer-command-prompt-for-vs2013)
