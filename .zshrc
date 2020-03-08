# Path to your oh-my-zsh installation.
export ZSH=/Users/xavier/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

DEFAULT_USER="xavier"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# some vim aliases
#alias vim="/Applications/MacVim.app/Contents/MacOS/Vim -v"
alias vim="nvim"
alias v="nvim"

alias view="nvim -R"
alias vimdiff="nvim -d"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump brew encode64)

# User configuration

export LC_ALL=en_US.UTF-8
export REDIS_HOME="/Users/xavier/dev/redis-3.2.0/src/"
export GOPATH="/Users/xavier/dev/gohome"
# export PATH="/Users/xavier/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/go/bin:"$REDIS_HOME":$GOPATH/bin:/Library/TeX/texbin"
export PATH="/Users/xavier/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/go/bin:/Users/xavier/dev/redis-3.2.0/src/:/Users/xavier/dev/gohome/bin:/Library/TeX/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

# alias for couchbase command line
alias cbq="/Applications/Couchbase\ Server.app/Contents/Resources/couchbase-core/bin/cbq"
alias gck="git checkout"
alias gcb="git checkout -b"
alias gdf="git diff --color | diff-so-fancy | less"
alias glf="git log -p --color | diff-so-fancy | less"
alias gcg="github_changelog_generator -t a4dee28534d434830191857c13742f6feee1dc02"
export NVM_DIR="/Users/xavier/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source $ZSH/oh-my-zsh.sh

# export GIT_EDITOR="/usr/local/Cellar/macvim/7.4-81/MacVim.app/Contents/MacOS/Vim -v"
export GIT_EDITOR="nvim"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#bindkey '^r' history-incremental-search-backward
#export KEYTIMEOUT=1

# export PATH="$HOME/.yarn/bin:$PATH"

unalias gm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
eval "$(pyenv init -)"

alias pc="proxychains4"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
setopt ignoreeof

# https://asciinema.org/a/296507
function clj() {
    if [[ -z $@ ]]
    then
        command clojure -A:repl
    else
        command clj $@
    fi
  }
