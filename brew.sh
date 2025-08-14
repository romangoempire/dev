#!/bin/bash

brew install -q zsh zsh-syntax-highlighting git wget jj fzf asdf overmind fastfetch btop cloc docker
# programming languages
brew install -q elixir
# tools for languages
brew install -q elixir-ls livebook uv typst ollama
# main applications
brew install --cask -q 1password raycast google-chrome zen linearmouse shottr spotify
# communication
brew install --cask -q signal discord whatsapp telegram zoom microsoft-teams
# coding
brew install --cask -q ghostty zed bruno db-browser-for-sqlite visual-studio-code
brew install --cask -q linear-linear obsidian raspberry-pi-imager inkscape figma
brew install --cask -q font-jetbrains-mono font-monaspace font-blex-mono-nerd-font font-fire-code
# Baduk
brew install --cask -q katago sabaki katrain
# Other
brew install --cast -q obs tradingview

brew update && brew upgrade && brew cleanup
