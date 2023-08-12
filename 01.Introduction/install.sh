#!/usr/bin/env bash 

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


# Apple silicon returns arm64; intel mac returns x86_64
ARCH=`uname -m`


echo "Installing brew..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 

echo "brew installed!"

if [[ $ARCH == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/Homebrew/bin/brew shellenv)"
fi

echo "now installing necessary packages..."

PKGS=(git tree wget curl openjdk@17 maven maven-completion eclipse-jee sourcetree iterm2 vim )

SEGMENT=7

install PKGS[@] install $SEGMENT 

echo "packages installed!"

# setup git repo
mkdir -p ~/Projects/kiwee-co/
cd ~/Projects/kiwee-co/
git clone https://github.com/Kiwee-Co/Coding101.git
git clone https://github.com/Kiwee-Co/CodingExercise101.git

echo "github materials installed!"

brew cleanup -s --prune=all 

echo "All done!"

