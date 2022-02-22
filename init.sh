#!/usr/bin/env bash

function main() {
  cp gitconfig ~/.gitconfig
  cp bash_profile ~/.bash_profile
  cp vimrc ~/.vimrc
  cp Brewfile ~/.Brewfile
  cp greeting.sh ~/.greeting.sh
  cp gitignore_global ~/.gitignore_global
  
  brew bundle --global
}

main "$@"
