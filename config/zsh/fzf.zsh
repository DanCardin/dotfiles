[[ $- == *i* ]] && source "$XDG_CONFIG_HOME/fzf/completion.zsh" 2> /dev/null

source "$XDG_CONFIG_HOME/fzf/key-bindings.zsh"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
