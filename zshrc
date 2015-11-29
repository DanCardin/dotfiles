# load zgen
source ~/.dotfiles/zgen/zgen.zsh

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # zgen prezto editor key-bindings 'vim'
    zgen prezto prompt theme 'sorin'

    # zgen oh-my-zsh
    zgen prezto
    zgen prezto git
    zgen prezto syntax-highlighting
    zgen prezto completion
    zgen prezto command-not-found
    zgen prezto osx
    zgen prezto python
    zgen prezto ssh
    zgen prezto tmux

    # plugins
    # zgen oh-my-zsh plugins/command-not-found
    # zgen oh-my-zsh plugins/common-aliases
    # zgen oh-my-zsh plugins/git
    # zgen oh-my-zsh plugins/git-extras
    # zgen oh-my-zsh plugins/pip
    # zgen oh-my-zsh plugins/python
    # zgen oh-my-zsh plugins/ssh-agent
    # zgen oh-my-zsh plugins/sudo
    # zgen oh-my-zsh plugins/virtual-env

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-history-substring-search
        djui/alias-tips
        sharat87/zsh-vim-mode
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi

bindkey -M vicmd 'j' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
alias please='sudo $(fc -ln -1)'

TERM=screen-256color
alias tmux="tmux -2"

export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/usr/local/Cellar/android-sdk/24.4.1
export PATH=${PATH}:$JAVA_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
if [ -f ~/.git_functions ]; then
  source ~/.git_functions
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]; then
  rm -f /tmp/ssh-agent-$USER-screen
  ln -sf $SSH_AUTH_SOCK $SOCK
  export SSH_AUTH_SOCK=$SOCK
fi

if [ -f ~/Capstone ]; then
  export WORKON_HOME=~/.virtualenvs
  VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
  PROJECT_HOME='/home/capstone/Capstone'
  source /usr/local/bin/virtualenvwrapper.sh
fi
