source ~/.dotfiles/zgen/zgen.zsh

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen loadall <<EOPLUGINS
        DanCardin/zsh-vim-mode
        S1cK94/minimal minimal
        chrissicool/zsh-256color
        djui/alias-tips
        unixorn/autoupdate-zgen
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-history-substring-search
EOPLUGINS
    zgen load zsh-users/zsh-completions src
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
