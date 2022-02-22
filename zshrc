#!/usr/bin/env zsh

export GIT_EDITOR="vim"
export EDITOR="vim"

export PATH="/opt/homebrew/bin:${PATH}"
export PATH="${GOPATH}/bin:${PATH}"
export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:${PATH}"

alias vim="vim"
alias vi="vim"
alias gap="git add -p"
alias gp="git push"
alias gup="git fetch --all && git pull --rebase --autostash"
alias k="kubectl"
alias ll="ls -al"
alias tmux='tmux -u'

function download() {
  aria2c -x 16 -s 16 "$@"
}

$HOME/.greeting.sh
