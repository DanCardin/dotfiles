ZSH_AUTOSUGGEST_USE_ASYNC=true

source ~/.zplug/init.zsh

zplug 'mfaerevaag/wd', as:command, use:"wd.sh", hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"
zplug "mafredri/zsh-async",                     defer:1
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting",       defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zdharma/fast-syntax-highlighting"

zplug "chrissicool/zsh-256color"
zplug "DanCardin/zsh-vim-mode"
zplug "plugins/pip", from:oh-my-zsh

# Load theme file
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Then, source plugins and add commands to $PATH
zplug load

zplug_init() {
  touch $ZPLUG_LOADFILE
}
