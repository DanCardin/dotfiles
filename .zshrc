source ~/.zgen/zgen.zsh

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# Zsh Settings
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

# Zgen plugins
if ! zgen saved; then
    echo "Creating a zgen save"

    # S1cK94/minimal minimal
    # subnixr/minimal
    zgen loadall <<EOPLUGINS
        chrissicool/zsh-256color
        djui/alias-tips
        unixorn/autoupdate-zgen
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-history-substring-search
        zsh-users/zsh-completions
        RobSis/zsh-completion-generator
        DanCardin/zsh-vim-mode
        zsh-users/zsh-autosuggestions
        mafredri/zsh-async
EOPLUGINS

    zgen load sindresorhus/pure

    zgen oh-my-zsh plugins/ssh-agent

    zgen save
fi

source ~/.aliases

export PATH="$HOME/.linuxbrew/bin:$PATH"
export PYTHONSTARTUP=$HOME/.pythonstartup
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PATH="/home/dan/.pyenv/bin:$PATH"
export GOPATH="$HOME/.gocode/"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig"
export PATH="$HOME/.linuxbrew/bin:$PATH"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(direnv hook zsh)"               # Auto source the virtualenv

minimal_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.*/*"'

bindkey '^ ' autosuggest-accept
bindkey '^p' backward-word
bindkey '^n' forward-word

fvim() {
  local IFS=$'\n'
  local files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
zle -N fvim
bindkey '^v' fvim

export PATH="$HOME/.bin:$PATH"

PATH="/home/dan/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/dan/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/dan/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/dan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/dan/perl5"; export PERL_MM_OPT;
