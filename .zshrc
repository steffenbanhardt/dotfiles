HISTFILE=~/.zshhistfile
HISTSIZE=5000
SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_CD

bindkey -e

# COMPLETION SETTINGS
# add custom completion scripts
fpath=(~/.zsh/completion $fpath)

# The following lines were added by compinstall
zstyle :compinstall filename '/home/steffen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PAGER='less'
EDITOR='vim'

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi

for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"

#color man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;37m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


#if [[ "$USER" != "root" ]]; then
  #PS1="$PR_BLUE%n$PR_GREEN@$PR_CYAN%U%m%u$PR_NO_COLOR:$PR_RED%2c$PR_NO_COLOR%(!.#.$) "
#else
  #PS1="$PR_YELLOW%n$PR_GREEN@$PR_CYAN%U%m%u$PR_NO_COLOR:$PR_RED%2c$PR_NO_COLOR%(!.#.$) "
#fi

#Uhrzeit rechts -- in smb theme!
##RPS1="$PR_NO_COLOR( $PR_LIGHT_RED%/$PR_NO_COLOR )"
#RPS1="$PR_LIGHT_YELLOW(%D{%H:%M})$PR_NO_COLOR"


# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

#alias ll='ls -alh'
alias grep='egrep --color'
alias egrep='egrep --color'
alias cd..='cd ..'
alias cls=clear
alias -g G='| rg'
alias :q='exit'
alias todo=task
alias dconf-search='gsettings list-recursively | less'
alias jrnl=' jrnl'

alias RMTEX='rm -Iv */**/*(aux|bbl|bcf|blg|blx\.bib|log|lof|out|run\.xml|~)'
alias rmtex='rm -Iv ./*(aux|bbl|bcf|blg|blx\.bib|log|lof|out|run\.xml|~)'

heute=$(date +%Y-%m-%d)
gestern=$(date -d "yesterday" +%Y-%m-%d)
morgen=$(date -d "tomorrow" +%Y-%m-%d)
So=$(date -d "next Sunday" +%Y-%m-%d)
Mo=$(date -d "next Monday" +%Y-%m-%d)
Di=$(date -d "next Tuesday" +%Y-%m-%d)
Mi=$(date -d "next Wednesday" +%Y-%m-%d)
Do=$(date -d "next Thursday" +%Y-%m-%d)
Fr=$(date -d "next Friday" +%Y-%m-%d)
Sa=$(date -d "next Saturday" +%Y-%m-%d)

#GNUSTEP Environment vars
# . /usr/share/GNUstep/Makefiles/GNUstep.sh

### oh-my-zsh
#
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="smb"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(git) #vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
### END
#


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
