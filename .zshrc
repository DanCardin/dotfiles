source ~/.zgen/zgen.zsh

if ! zgen saved; then
    echo "Creating a zgen save"

    # S1cK94/minimal minimal
    zgen loadall <<EOPLUGINS
        chrissicool/zsh-256color
        djui/alias-tips
        unixorn/autoupdate-zgen
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-history-substring-search
        zsh-users/zsh-completions
        RobSis/zsh-completion-generator
        DanCardin/zsh-vim-mode
        subnixr/minimal
        zsh-users/zsh-autosuggestions
EOPLUGINS
    zgen save
fi

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# setopt inc_append_history
HISTCONTROL=ignoreboth
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_verify
setopt promptpercent
setopt promptsubst

source ~/.aliases

export PATH="$HOME/.linuxbrew/bin:$PATH"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PATH="/home/dan/.pyenv/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(direnv hook zsh)"               # Auto source the virtualenv
# eval "$(thefuck --alias)"

minimal_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
