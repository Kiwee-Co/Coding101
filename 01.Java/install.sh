#!/usr/bin/env bash 

echo "Installing brew..."
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
echo "brew installed!"

echo "now installing necessary packages..."

PKGS=(bash guntls bash-completion git btop tree unrar wget curl openjdk@17 maven maven-completion eclipse-java sourcetree iterm2 )

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
    echo "  - Installing $PKG"
    brew install $PKG -q
  done
}


install PKGS "install" $SEGMENT 

# copy git prompt
cp .bash ~/.bash
echo "source ~/.bash" >> .bash_profile
cp .git-prompt.sh ~/
cp .git-competion.bash ~/

chsh -s /usr/local/bin/bash

brew cleanup -s --prune=all 

echo "All done!"

