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


export PATH="$HOME/.serverless/bin:$PATH"

export GOPATH=~/go

export EDITOR=/usr/bin/nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases ] && source ~/.aliases

parse_git() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="[\[[m\]\[\033[38;5;10m\]\T\[[m\]] \[[m\]\[[1m\]\[\033[38;5;45m\]\W\[[m\] \[[m\]\$(parse_git) "
