source ~/.zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle npm
antigen bundle wd
antigen bundle sudo
antigen bundle docker
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# Setup autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Tell antigen that you're done.
antigen apply

export FZF_TMUX=0
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/home/drew/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias gpp='git status | fpp'
