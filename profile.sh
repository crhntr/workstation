#!/usr/bin/env bash

export GIT_EDITOR="nvim"
export EDITOR="nvim"
export GOPATH=$HOME

export PATH="${PATH}:${GOPATH}/bin"

alias vim="nvim"

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

eval "$(fasd --init auto)"

./.greeting.sh
