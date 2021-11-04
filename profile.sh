#!/usr/bin/env zsh

export HISTCONTROL=ignoreboth
# Maximum number of history lines in memory
export HISTSIZE=50000
# Maximum number of history lines on disk
export HISTFILESIZE=50000
# Setting the man pager to bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export GIT_EDITOR="nvim"
export EDITOR="nvim"

export PATH="${PATH}:${GOPATH}/bin"
export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"

alias vim="nvim"
alias vi="nvim"
alias gap="git add -p"
alias gp="git push"
alias gup="git fetch --all && git pull --rebase --autostash"
alias k="kubectl"
alias ll="ls -al"
alias tmux='tmux -u'

function download() {
  aria2c -x 16 -s 16 "$@"
}

function git_branch() {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}

$HOME/.greeting.sh
