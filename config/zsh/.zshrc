# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

source ~/.config/zsh/settings.zsh
source ~/.config/zsh/ssh.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/osc.zsh

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=vim

# source "/nix/var/nix/profiles/default/etc/profile.d/nix.sh"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

export DOCKER_BUILDKIT=1
export DIRENV_LOG_FORMAT=

# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh --cmd m --hook prompt )"
eval "$(sauce --shell zsh shell init)"
eval "$(prp --shell zsh shell init)"
eval "$(wd --shell zsh shell init)"
eval "$(starship init zsh)"
eval "$(atuin init --disable-up-arrow zsh)"

_venv_autoload() {
  prp activate
}

add-zsh-hook chpwd _venv_autoload
_venv_autoload

# bun completions
[ -s "/Users/danc/.bun/_bun" ] && source "/Users/danc/.bun/_bun"

. "/Users/danc/.local/share/cargo/env"
