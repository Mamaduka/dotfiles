# Load dotfiles binaries
# export PATH="$DOTFILES/bin:$PATH"

# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# DBngin
export PATH="/Users/Shared/DBngin/mysql/8.0.19/bin:$PATH"

# GPG
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
