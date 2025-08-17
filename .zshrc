export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

HIST_STAMPS="yyyy-mm-dd"

plugins=(git)

export PATH="$HOME/.local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

source $HOME/dev/.zsh_aliases

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"

autoload -Uz compinit && compinit
