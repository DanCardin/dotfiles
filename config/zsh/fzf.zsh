if [[ ! "$PATH" == "*$HOME/.fzf/bin" ]]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

source "$HOME/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
