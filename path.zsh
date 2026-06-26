# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# PHP 8.3 (keg-only)
export PATH="/opt/homebrew/opt/php@8.3/bin:/opt/homebrew/opt/php@8.3/sbin:$PATH"

# DBngin MySQL client (so `wp db` can find the mysql binary)
dbngin_mysql=(/Users/Shared/DBngin/mysql/*/bin(N))
(( ${#dbngin_mysql} )) && export PATH="${dbngin_mysql[-1]}:$PATH"
