# Remove all ESC keybinds (makes zsh wait before going into normal mode).
KEYTIMEOUT=1
bindkey -m 2>/dev/null

export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'mfaerevaag/wd', as:command, use:"wd.sh", hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"
zplug "mafredri/zsh-async",                     defer:1
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting",       defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zdharma/fast-syntax-highlighting"
zplug "hlissner/zsh-autopair", defer:2
zplug "chisui/zsh-nix-shell"

zplug "chrissicool/zsh-256color"
zplug "DanCardin/zsh-vim-mode"
zplug "aperezdc/zsh-fzy"

# Load theme file
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Then, source plugins and add commands to $PATH
zplug load

zplug_init() {
  touch $ZPLUG_LOADFILE
}

bindkey -a ' ' undefined-key
bindkey -a ' p' fzy-file-widget
bindkey -a ' o' fzy-history-widget
bindkey -a '^R' fzy-history-widget
bindkey -a ' c' fzy-cd-widget
bindkey -a ' i' fzy-proc-widget
