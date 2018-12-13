#!/usr/bin/env bash

function main() {
  brew bundle --global
  cp gitconfig ~/.gitconfig
  cp profile.sh ~/.bash_profile
  cp vimrc ~/.vimrc
  cp Brewfile ~/.Brewfile
  cp greeting.sh ~/.greeting.sh
  cp gitignore_global ~/.gitignore_global
}

main "$@"
