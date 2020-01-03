export SSL_CERT_FILE="$HOME/.nix-profile/etc/ssl/certs/ca-bundle.crt"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

source ~/.config/zsh/settings.zsh
source ~/.config/zsh/ssh.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/functions.zsh
source ~/work/credentials

bindkey '^ ' autosuggest-accept
bindkey '^p' backward-word
bindkey '^n' forward-word

export PATH="$HOME/.poetry/bin:$PATH"

. /Users/dancardin/.nix-profile/etc/profile.d/nix.sh
# . $ASDF_DIR/asdf.sh
# . $ASDF_DIR/completions/asdf.bash

# Only execute compinit at most once per day.
autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit -d $XDG_CACHE_HOME/zsh/zcompdump
else
	compinit -C -d $XDG_CACHE_HOME/zsh/zcompdump
fi;

export WORMHOLE_RELAY_URL=ws://wormhole.schireson.com:4000/v1
export WORMHOLE_TRANSIT_HELPER=tcp:wormhole.schireson.com:4001

export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
export DOCKER_BUILDKIT=1

export DIRENV_LOG_FORMAT=
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
