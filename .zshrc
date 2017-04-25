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


if [[ "$USER" != "root" ]]; then
  PS1="$PR_BLUE%n$PR_GREEN@$PR_CYAN%U%m%u$PR_NO_COLOR:$PR_RED%2c$PR_NO_COLOR%(!.#.$) "
else
  PS1="$PR_YELLOW%n$PR_GREEN@$PR_CYAN%U%m%u$PR_NO_COLOR:$PR_RED%2c$PR_NO_COLOR%(!.#.$) "
fi

#RPS1="$PR_NO_COLOR( $PR_LIGHT_RED%/$PR_NO_COLOR )"
RPS1="$PR_LIGHT_YELLOW(%D{%H:%M})$PR_NO_COLOR"


# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

alias ll='ls -alh'
alias grep='egrep --color'
alias egrep='egrep --color'
alias cd..='cd ..'
alias cls=clear
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g G='| egrep --color'
#alias -g X='| xargs egrep --color' #bescheuerte Idee! wie heißt noch mal der X-Server? genau!
alias :q='exit'
alias todo=task
alias dconf-search='gsettings list-recursively | less'
alias jrnl=' jrnl'

alias RMTEX='rm -Iv */**/*(aux|bbl|bcf|blg|blx\.bib|log|out|run\.xml|~)'
alias rmtex='rm -Iv ./*(aux|bbl|bcf|blg|blx\.bib|log|out|run\.xml|~)'

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

#eval "$(thefuck --alias)"
