# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dan/.fzf/bin* ]]; then
  export PATH="$PATH:/home/dan/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/dan/.fzf/man* && -d "/home/dan/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/dan/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dan/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/dan/.fzf/shell/key-bindings.zsh"

