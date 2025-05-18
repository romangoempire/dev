#!/bin/bash

function color {
    echo -e "\e[1;36m$1\e[0m"
}

# list of files/directories to link from ~/dev to $HOME
items=(
  .config
  .zshrc
  .tool-versions
  .gitconfig
)

for item in "${items[@]}"; do
  color "Create link to ~/dev/$item..."
  rm "$HOME/$item"
  ln -s "$HOME/dev/$item" "$HOME/$item"
done

color "Create link to ~/dev/.tool-versions..."
rm -rf $HOME/.tool-versions
ln -s $HOME/dev/.tool-versions $HOME/.tool-versions

# install brew
if ! command -v brew >/dev/null 2>&1; then
    color "Installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# install ohmyzsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    color "Install ohmyzsh"
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

# install from brew
color "Installing from brew..."
source $HOME/dev/brew.sh

# set zsh as default
# color "Set zsh as default..."
#  chsh -s $(which zsh)

# add github key
github_key="$HOME/.ssh/github"

if [ ! -f "$github_key" ]; then
    color "Github key does not exist, generating..."
    ssh-keygen -t ed25519 -f "$github_key"
fi

# restart zsh
source $HOME/.zshrc
