### Added by Zplugin's installer
if [[ ! -d $HOME/.local/share/zsh/.zplugin/bin ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing Zplugin…%f"
    command mkdir -p $HOME/.local/share/zsh/.zplugin
    command git clone https://github.com/zdharma/zplugin $HOME/.local/share/zsh/.zplugin/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.local/share/zsh/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin ice wait"0" lucid as"program" pick"wd.sh"\
        mv"_wd.sh -> _wd"\
        atload"wd() { source wd.sh }" blockf
zplugin light mfaerevaag/wd

zplugin ice wait"0" lucid blockf
zplugin light zsh-users/zsh-completions

export ZSH_AUTOSUGGEST_USE_ASYNC=true
zplugin ice wait"0" lucid atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" lucid
zplugin load zsh-users/zsh-history-substring-search

zplugin ice wait"0" lucid
zplugin load hlissner/zsh-autopair

zplugin ice wait"0" lucid
zplugin load chisui/zsh-nix-shell

zplugin ice wait"0" lucid
zplugin load chrissicool/zsh-256color

zplugin load DanCardin/zsh-vim-mode

zplugin ice wait"0" lucid from"gh-r" as"program"
zplugin load junegunn/fzf-bin

zplugin ice wait"0" lucid pick"shell/key-bindings.zsh"
zplugin load junegunn/fzf

zplugin ice wait"!1" lucid atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting
