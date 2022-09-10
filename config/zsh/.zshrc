# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/zsh/settings.zsh
source ~/.config/zsh/ssh.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/osc.zsh

export PATH="$HOME/.poetry/bin:$PATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=vim

export PATH="$HOME/.local/bin:$PATH"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
export DOCKER_BUILDKIT=1
export DIRENV_LOG_FORMAT=

source "$HOME/.nix-profile/etc/profile.d/nix.sh"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

eval "$(zoxide init zsh --cmd m --hook prompt )"
eval "$(sauce --shell zsh shell init)"

alias work='nix-shell'


_venv_autoload() {
  if [[ -e ".venv/bin/activate" ]]; then
    echo "activating venv"
    source ".venv/bin/activate"
  fi
}

add-zsh-hook chpwd _venv_autoload
_venv_autoload
