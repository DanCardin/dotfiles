source ~/.config/zsh/settings.zsh
source ~/.config/zsh/ssh.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/osc.zsh

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=vim

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

export DOCKER_BUILDKIT=1

eval "$(zoxide init zsh --cmd m --hook prompt )"
eval "$(sauce --shell zsh shell init)"
eval "$(prp --shell zsh shell init)"
eval "$(wd --shell zsh shell init)"
eval "$(starship init zsh)"
eval "$(atuin init --disable-up-arrow zsh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# bun completions
[ -s "/Users/danc/.bun/_bun" ] && source "/Users/danc/.bun/_bun"
