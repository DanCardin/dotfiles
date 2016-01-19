# load zgen
source ~/.dotfiles/zgen/zgen.zsh

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # plugins
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/ssh-agent
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/virtual-env

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-history-substring-search
        djui/alias-tips
        DanCardin/zsh-vim-mode
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    zgen load zsh-users/zsh-completions src
    zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi

alias please='sudo $(fc -ln -1)'
alias tmux="tmux -2"

TERM=screen-256color

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]; then
  rm -f /tmp/ssh-agent-$USER-screen
  ln -sf $SSH_AUTH_SOCK $SOCK
  export SSH_AUTH_SOCK=$SOCK
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
