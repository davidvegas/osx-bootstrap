# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pharp"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmux python pep8 pip brew fabric virtualenv-prompt)

# tmux
ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# User configuration

setopt histignorespace

# Check if the shell we are using is spawned from vim
if [ -n "$VIMRUNTIME" ]; then
    export RPROMPT="$RPROMPT"'$FG[238]vim%{$reset_color%}'
fi

# Ensure homebrew installs take precedence over system installs
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# I like to have a ~/local/bin too
export PATH="$HOME/local/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# I like vim
export EDITOR=vim
export VISUAL=

# Go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export GOROOT="/usr/local/Cellar/go/1.2/libexec"

# Vim keybindings
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# todo
alias todo="todo.sh"

# Chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# Chartio
alias handlebars-watch="watchmedo shell-command \
    --patterns=\"*.handlebars\" --recursive \
    --command=\"fab vagrant handlebars:/srv/sqlcharts\""

alias mutt="(cd ~/Downloads; \mutt)"

alias irssi="tmux split-window -h \"perl ~/.irssi/scripts/adv_windowlist.pl\" && \
    tmux swap-pane -D && tmux resize-pane -x 10 && \
    tmux select-pane -R && \
    \irssi"

HOSTZSHRC="$HOME/.$HOST.zsh"
if [ -e "$HOSTZSHRC" ]; then
    source "$HOSTZSHRC"
fi
