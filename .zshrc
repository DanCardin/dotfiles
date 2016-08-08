source ~/.zgen/zgen.zsh

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen loadall <<EOPLUGINS
        S1cK94/minimal minimal
        chrissicool/zsh-256color
        djui/alias-tips
        unixorn/autoupdate-zgen
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-history-substring-search
        zsh-users/zsh-completions
        zsh-users/zsh-autosuggestions
        RobSis/zsh-completion-generator
        DanCardin/zsh-vim-mode
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
# setopt share_history
setopt promptpercent
setopt promptsubst

source ~/.aliases

# Auto source the virtualenv
eval "$(direnv hook zsh)"
show_virtual_env() {
  if [ -n "$CONDA_DEFAULT_ENV" ]; then
    echo "($CONDA_DEFAULT_ENV)"
  fi
}
PS1='$(show_virtual_env)'$PS1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by Miniconda3 4.0.5 installer
export PATH="/home/dan/.miniconda3/bin:$PATH"
