# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
#
# export GIT_SSL_CAINFO="$HOME/.nix-profile/etc/ssl/certs/ca-bundle.crt"
# export SSL_CERT_FILE="$HOME/.nix-profile/etc/ssl/certs/ca-bundle.crt"

source ~/.config/zsh/settings.zsh
source ~/.config/zsh/ssh.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/functions.zsh
source ~/work/credentials

export PATH="$HOME/.poetry/bin:$PATH"

export WORMHOLE_RELAY_URL=ws://wormhole.schireson.com:4000/v1
export WORMHOLE_TRANSIT_HELPER=tcp:wormhole.schireson.com:4001

export PATH="$HOME/.local/bin:$PATH"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
export DOCKER_BUILDKIT=1

export DIRENV_LOG_FORMAT=
# eval "$(starship init zsh)"

# Remove all ESC keybinds (makes zsh wait before going into normal mode).
KEYTIMEOUT=1
bindkey -m 2>/dev/null
bindkey -a ' ' undefined-key

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

. /Users/danc/.nix-profile/etc/profile.d/nix.sh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
