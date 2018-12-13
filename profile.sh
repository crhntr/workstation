#!/usr/bin/env bash

function download() {
  aria2c -x 16 -s 16 "$@"
}

function www_github() {
  open https://github.com/$1
}

function git_branch() {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}

export PS1="\w\n$(git_branch)\$ "

alias vim="nvim"
export GIT_EDITOR="nvim"
export EDITOR="nvim"

eval "$(fasd --init auto)"

./.greeting.sh
