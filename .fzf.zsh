# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dan/.fzf/bin* ]]; then
  export PATH="$PATH:/home/dan/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dan/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/dan/.fzf/shell/key-bindings.zsh"

