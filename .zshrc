export DOTFILES=$HOME/.dotfiles

DISABLE_AUTO_TITLE="true"
MAILCHECK=0

setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY
setopt EXTENDED_GLOB

# Load custom config
source $DOTFILES/path.zsh
source $DOTFILES/aliases.zsh

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fnm
eval "$(fnm env --use-on-cd)"

# Prompt
eval "$(starship init zsh)"
