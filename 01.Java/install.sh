#!/usr/bin/env bash 

echo "Installing brew..."
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
echo "brew installed!"

echo "now installing necessary packages..."

PKGS=(bash bash-completion git btop tree unrar wget curl openjdk@17 maven) 

CASK=(eclipse-java sourcetree bluej)

SEGMENT=7


install() {
  local -n param1=$1
  local brew_command=$2
  local group_size=$3

  for ((i = 0; i < ${#param1[@]}; i += group_size)); do
    PKG=""
    for ((j = i; j < i + group_size && j < ${#param1[@]}; j++)); do
      PKG="$PKG ${param1[j]}"
    done
    brew $brew_command $PKG
  done
}


install PKGS "install" $SEGMENT
install CASK "install" $SEGMENT

brew cask cleanup 
brew cleanup -s --prune=all 

echo "All done!"

