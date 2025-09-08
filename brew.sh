#!/usr/bin/env bash

is_formula_installed() {
  brew list --formula --versions "$1" &>/dev/null
}

is_cask_installed() {
  brew list --cask --versions "$1" &>/dev/null
}

is_formula() {
  brew info --formula "$1" &>/dev/null
}

is_cask() {
  brew info --cask "$1" &>/dev/null
}

install_bulk() {
  local formulas=()
  local casks=()

  for pkg in "$@"; do
    if is_formula_installed "$pkg" || is_cask_installed "$pkg"; then
      echo "✅ Already installed: $pkg"
    else
      if is_formula "$pkg"; then
        formulas+=("$pkg")
      elif is_cask "$pkg"; then
        casks+=("$pkg")
      else
        echo "⚠️  Not found in Homebrew: $pkg"
      fi
    fi
  done

  if ((${#formulas[@]})); then
    echo "📦 Installing formulas: ${formulas[*]}"
    brew install "${formulas[@]}"
  fi

  if ((${#casks[@]})); then
    echo "📦 Installing casks: ${casks[*]}"
    brew install --cask "${casks[@]}"
  fi
}

# ---------------------------
# Shell & Terminal Enhancements
# ---------------------------
install_bulk zsh zsh-syntax-highlighting \
  git jj mise wget \
  fzf ripgrep cloc tldr \
  fastfetch btop \
  ollama docker

# ---------------------------
# Main Applications
# ---------------------------
install_bulk 1password raycast google-chrome zen linearmouse shottr spotify docker-desktop jordanbaird-ice

# ---------------------------
# Communication Apps
# ---------------------------
install_bulk signal discord whatsapp telegram zoom microsoft-teams

# ---------------------------
# Coding & Development Tools
# ---------------------------
install_bulk ghostty zed bruno datagrip \
  linear-linear obsidian raspberry-pi-imager inkscape figma

# ---------------------------
# Fonts
# ---------------------------
install_bulk font-jetbrains-mono font-monaspace \
  font-blex-mono-nerd-font font-fira-code

# ---------------------------
# Baduk (Go Game) Tools
# ---------------------------
install_bulk katago sabaki katrain

# ---------------------------
# Other Applications
# ---------------------------
install_bulk obs tradingview

# ---------------------------
# Update & Cleanup
# ---------------------------
brew update
brew upgrade --greedy
brew cleanup

# Only pause if script is run in a way that would close the terminal
if [[ $- != *i* ]]; then
  read -rp "✅ All done! Press Enter to close..."
fi
