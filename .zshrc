# Path to your oh-my-zsh installation.
export ZSH=/Users/aas/.oh-my-zsh
# Set name of the theme to load.

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/aas/code/digipost/digipost/scripts:/Users/aas/code/digipost/digipost-sub/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#Add the fuck to repo
eval $(thefuck --alias)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Npm 
export PATH="$HOME/.node/bin:$PATH"
export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

# added by travis gem
[ -f /Users/aas/.travis/travis.sh ] && source /Users/aas/.travis/travis.sh

# innstillinger for sikker-digital-post-klient-java for BRING
export no_difi_sdp_client2_virksomhetssertifikat_passord=yJPvczYAoirFfC9M
export no_difi_sdp_client2_virksomhetssertifikat_alias="digipost testintegrasjon for digital post"
export no_difi_sdp_client2_virksomhetssertifikat_sti="/Users/aas/virksomhetssertifikat.p12"

# innstillinger for sikker-digital-post-klient-java for POSTEN
#export virksomhetssertifikat_passord=CENCORED
#export virksomhetssertifikat_alias=CENCORED
#export virksomhetssertifikddat_sti=CENCORED

source ~/.digipostrc

# Prompt substitution for Sindres superfunksjon -------------------------------
setopt PROMPT_SUBST
PROMPT+='$(vpns Connecting)$(vpns Connected) '
# ------------------------------------------------------------------------------



# Legger til /usr/local/bin for git fra brew
export PATH="/usr/local/bin:$PATH"

alias dppass="export PASSWORD_STORE_DIR=${DPOST_REPOS_PATH}/digipost-passwords"
alias vpnpass="export PASSWORD_STORE_DIR=${DPOST_REPOS_PATH}/vpn-passwords"

#EMACS magic for ML
export PATH="$PATH:/usr/local/smlnj/bin"

#Valdmanis kill all screens
alias kill-all-screens="screen -list | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill"

# Load SSH-keys from keychain
{ eval ssh-agent; ssh-add -A; } &>/dev/null
