# Start tmux or attach to existing tmux session
HOSTNAME=$(hostname -s)
if [[ $TMUX = "" ]]; then
  # try to reattach sessions
  tmux ls | grep -vq attached && TMUXARG="attach-session -d"
  exec eval "tmux -2 $TMUXARG"
fi

source ~/.zplug/init.zsh

# oh-my-zsh
zplug lib/history, from:oh-my-zsh
zplug lib/completion, from:oh-my-zsh
zplug plugins/git, from:oh-my-zsh
zplug plugins/npm, from:oh-my-zsh
zplug plugins/yarn, from:oh-my-zsh
zplug plugins/wd, from:oh-my-zsh
zplug plugins/sudo, from:oh-my-zsh
zplug plugins/docker, from:oh-my-zsh
zplug plugins/command-not-found, from:oh-my-zsh

# Other plugins
zplug zpm-zsh/ls
zplug MichaelAquilina/zsh-you-should-use
zplug ael-code/zsh-colored-man-pages
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-syntax-highlighting, defer:2

# Pure theme
zplug mafredri/zsh-async
zplug sindresorhus/pure

if ! zplug check; then
  zplug install
fi

# Tell zplug that you're done.
zplug load

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
alias ltb="yarn lint && yarn test && yarn build"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
