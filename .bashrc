alias tmux="tmux -2"

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

source ~/.aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# added by Miniconda3 4.0.5 installer
export PATH="/home/dan/miniconda3/bin:$PATH"
