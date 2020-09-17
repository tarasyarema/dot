[ -z "$PS1" ] && return

# history related

HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# check for resize

shopt -s checkwinsize

# enable colors

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Path related

export PATH="$HOME/.serverless/bin:$PATH"

# Misc

export GOPATH=~/go
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Personal

export EDITOR=/usr/bin/nvim

[ -f ~/z/z.sh ] && source ~/z/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases ] && source ~/.aliases

[ -f ~/.custom ] && source ~/.custom

PS1="[\[$(tput sgr0)\]\[\033[38;5;10m\]\t\[$(tput sgr0)\]] \[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\] \[$(tput sgr0)\]"

#if [[ -f ~/.prompt ]]; then
#    source ~/.prompt
#    PS1+="\[\$(git_color)\]"
#    PS1+="\$(git_branch)"  
#    PS1+="\[$COLOR_RESET\] "
#fi

export PS1
