# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims":$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR="code"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="geometry/geometry"
export PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
export PROMPT_GEOMETRY_COLORIZE_ROOT=true
export PROMPT_GEOMETRY_EXEC_TIME=true

DEFAULT_USER=rajesh

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#plugins
plugins=(git npm ruby bundler zsh-autosuggestions dotenv)
# User configuration

# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH:$HOME/bin"

# load rbenv if available
if command -v rbenv >/dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

export -U PATH

source $ZSH/oh-my-zsh.sh
export PROJECTS_HOME=${HOME}/projects

#speed up escape in vim
# 10ms for key sequences
KEYTIMEOUT=1

ssh-add -A &> /dev/null
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias tas='tmux attach-session -t'
alias tagme='ctags -R --languages=ruby --exclude=.git --exclude=log .'
alias btagme='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'
alias kill_rspec=kill -9 `pgrep -f rspec`

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#env
source ~/.env
