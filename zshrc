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
antigen bundle tarruda/zsh-autosuggestions

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Pure theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell antigen that you're done.
antigen apply

# Setup autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250"

export EDITOR=nvim

export FZF_TMUX=0
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Custom aliases
alias gpp='git status | fpp'
alias title='export DISABLE_AUTO_TITLE=true && title'

alias ltb="yarn lint && yarn test && yarn build"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
