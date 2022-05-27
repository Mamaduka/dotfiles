# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub && echo 'Done!'"
alias reloadshell="source $HOME/.zshrc"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

# Directories
alias dotfiles="cd $DOTFILES"
alias sites="cd $HOME/Sites"
alias projects="cd $HOME/Projects"

# Custom commands
alias wpsite="sh $DOTFILES/bin/setup.sh"
alias wpremove="sh $DOTFILES/bin/remove.sh"
