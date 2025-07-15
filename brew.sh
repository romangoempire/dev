#!/bin/bash

brew install -q zsh git wget jj fzf asdf overmind fastfetch btop zsh-syntax-highlighting cloc
brew install -q elixir elixir-ls uv typst
brew install -q katago

brew install --cask -q 1password raycast google-chrome zen linearmouse shottr spotify
brew install --cask -q signal discord whatsapp telegram zoom microsoft-teams
brew install --cask -q ghostty zed linear-linear bruno obsidian db-browser-for-sqlite visual-studio-code livebook docker ollama
brew install --cask -q raspberry-pi-imager inkscape figma
brew install --cask -q obs sabaki katrain tradingview
brew install --cask -q font-jetbrains-mono font-monaspace font-blex-mono-nerd-font font-fire-code

brew update && brew upgrade && brew cleanup
