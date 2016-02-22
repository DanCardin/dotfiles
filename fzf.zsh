# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/dcardin/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/dcardin/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/dcardin/.fzf/man* && -d "/Users/dcardin/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/dcardin/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/dcardin/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/dcardin/.fzf/shell/key-bindings.zsh"

