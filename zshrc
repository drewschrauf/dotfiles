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
BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  custom
  # context
  dir
  perl
  ruby
  virtualenv
  nvm
  go
  git
  hg
  cmd_exec_time
)
BULLETTRAIN_NVM_FG=black
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# Setup autosuggestions
[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Tell antigen that you're done.
antigen apply

export EDITOR=nvim

export FZF_TMUX=0
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias gpp='git status | fpp'
alias title='export DISABLE_AUTO_TITLE=true && title'

[ -f ~/.todo/todo_completion ] && source ~/.todo/todo_completion
alias t='~/.todo/todo.sh'
alias te='nvim ~/.todo/todo.txt'

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
