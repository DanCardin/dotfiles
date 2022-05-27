declare -A ZINIT
ZINIT[BIN_DIR]="$HOME/.local/share/zsh/zinit/bin"
ZINIT[HOME_DIR]="$HOME/.local/share/zsh/zinit"
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=true
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

zstyle ':autocomplete:*' insert-unambiguous yes

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit ice wait lucid as"program" pick"wd.sh"\
        mv"_wd.sh -> _wd"\
        atload"wd() { source wd.sh }" blockf
zinit light mfaerevaag/wd

zinit ice wait lucid
zinit load zsh-users/zsh-history-substring-search

zinit ice wait"1" lucid
zinit load hlissner/zsh-autopair

zinit ice wait lucid
zinit load chisui/zsh-nix-shell

zinit ice wait lucid
zinit load chrissicool/zsh-256color

zinit load DanCardin/zsh-vim-mode

zinit load ellie/atuin

zinit load lotabout/skim
zinit ice wait"1" lucid
zinit snippet "$XDG_CONFIG_HOME/zsh/binds.zsh"

zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
    direnv/direnv

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions
