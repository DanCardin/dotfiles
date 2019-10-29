export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'mfaerevaag/wd', as:command, use:"wd.sh", hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"
zplug "mafredri/zsh-async",                     defer:1
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting",       defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zdharma/fast-syntax-highlighting"
zplug "hlissner/zsh-autopair", defer:2

zplug "chrissicool/zsh-256color"
zplug "DanCardin/zsh-vim-mode"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf

# Load theme file
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Then, source plugins and add commands to $PATH
zplug load

zplug_init() {
  touch $ZPLUG_LOADFILE
}
