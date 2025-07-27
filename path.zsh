# Load dotfiles binaries
# export PATH="$DOTFILES/bin:$PATH"

# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# DBngin paths
export PATH="/Users/Shared/DBngin/mysql/8.0.19/bin:$PATH"
export PATH="/Users/Shared/DBngin/mysql/8.0.27/bin:$PATH"
export PATH="/Users/Shared/DBngin/mysql/8.0.40_arm64/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
