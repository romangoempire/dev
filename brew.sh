#!/bin/bash

brew install -q zsh git wget jj fzf asdf overmind fastfetch btop zsh-syntax-highlighting cloc
brew install -q elixir elixir-ls uv
brew install -q katago

brew install --cask -q 1password raycast google-chrome zen linearmouse shottr spotify
brew install --cask -q signal discord whatsapp telegram zoom microsoft-teams
brew install --cask -q ghostty zed linear-linear bruno obsidian visual-studio-code livebook docker ollama
brew install --cask -q raspberry-pi-imager inkscape figma
brew install --cask -q obs sabaki katrain tradingview
brew install --cask -q font-jetbrains-mono font-monaspace

brew update && brew upgrade && brew cleanup
