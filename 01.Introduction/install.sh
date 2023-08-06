#!/usr/bin/env bash 

# Apple silicon returns arm64; intel mac returns x86_64
ARCH=`uname -m`

echo "Installing brew..."
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 

echo "brew installed!"

echo "now installing necessary packages..."

PKGS=(bash guntls bash-completion git btop tree unrar wget curl openjdk@17 maven maven-completion eclipse-jee sourcetree iterm2 netcat )

SEGMENT=7


install() {

  local param1=("${!1}") 	# packages
  local brew_command=$2		# brew cmd
  local group_size=$3		# size

  for ((i = 0; i < ${#param1[@]}; i += group_size)); do
    PKG=""
    for ((j = i; j < i + group_size && j < ${#param1[@]}; j++)); do
      PKG="$PKG ${param1[j]}"
    done
    echo "  - Installing $PKG"
    brew install $PKG -q 
  done
}


install PKGS[@] install $SEGMENT 

echo "packages installed!"

# copy git prompt
cp .bash ~/.bash
echo "source ~/.bash" >> ~/.bash_profile
cp .git-prompt.sh ~/
cp .git-competion.bash ~/


# setup git repo
mkdir -p ~/Projects/kiwee-co/
cd ~/Projects/kiwee-co/
git clone https://github.com/Kiwee-Co/Coding101.git
git clone https://github.com/Kiwee-Co/CodingExercise101.git

echo "setup bash for $ARCH mac..."

if [[ $ARCH == 'arm' ]]; then
  chsh -s /opt/homebrew/bin/bash
else
  chsh -s /usr/local/bin/bash
fi

brew cleanup -s --prune=all 

echo "All done!"

