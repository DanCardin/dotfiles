source ~/.config/zsh/settings.zsh
source ~/.config/zsh/ssh.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/functions.zsh
source ~/work/credentials

bindkey '^ ' autosuggest-accept
bindkey '^p' backward-word
bindkey '^n' forward-word

export PATH="$HOME/.poetry/bin:$PATH"

. $ASDF_DIR/asdf.sh
. $ASDF_DIR/completions/asdf.bash

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' $XDG_CACHE_HOME/zsh/zcompdump) ]; then
  compinit -d $XDG_CACHE_HOME/zsh/zcompdump
else
  compinit -C -d $XDG_CACHE_HOME/zsh/zcompdump
fi

export WORMHOLE_RELAY_URL=ws://wormhole.schireson.com:4000/v1
export WORMHOLE_TRANSIT_HELPER=tcp:wormhole.schireson.com:4001

export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
export DOCKER_BUILDKIT=1
