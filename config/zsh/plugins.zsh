declare -A ZINIT
ZINIT[BIN_DIR]="$HOME/.local/share/zsh/zinit/bin"
ZINIT[HOME_DIR]="$HOME/.local/share/zsh/zinit"

if [[ ! -d $HOME/.local/share/zsh/zinit/bin ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing zinit…%f"
    command mkdir -p $HOME/.local/share/zsh/zinit
    command git clone https://github.com/zdharma/zinit $HOME/.local/share/zsh/zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.local/share/zsh/zinit/bin/zinit.zsh"

zinit ice wait lucid as"program" pick"wd.sh"\
        mv"_wd.sh -> _wd"\
        atload"wd() { source wd.sh }" blockf
zinit light mfaerevaag/wd

zinit ice wait lucid
zinit load zsh-users/zsh-history-substring-search

# zinit ice wait lucid
# zinit load marlonrichert/zsh-autocomplete

zinit ice wait"1" lucid
zinit load hlissner/zsh-autopair

zinit ice wait lucid
zinit load chisui/zsh-nix-shell

zinit ice wait lucid
zinit load chrissicool/zsh-256color

zinit load DanCardin/zsh-vim-mode

zinit ice wait lucid pick"shell/key-bindings.zsh"
zinit load lotabout/skim

zinit ice wait"1" lucid
zinit snippet "$XDG_CONFIG_HOME/zsh/binds.zsh"

zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
    direnv/direnv

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
