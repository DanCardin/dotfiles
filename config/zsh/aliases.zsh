alias attach='tmux a -dt 0'
alias tmux="env TERM=screen-256color tmux -2"
alias vim="nvim"
alias ptpython="python -m ptpython"
alias ptipython="ipython -m ptpython"
alias freeze="pip freeze > requirements.txt"

# Git
alias ga='git add'
alias gd='git diff'
alias gc='git commit'
alias gs='git status'
alias gb='git branch'
alias gpom='git pull origin master'
alias gpod='git pull origin develop'
alias gpoom='git push origin master'
alias gpood='git push origin develop'

alias activate='source activate'
alias deactivate='source deactivate'

alias ls='exa'
alias ll='ls -la'
alias tree='exa -T --ignore __pycache'

pcat=alias c='pygmentize -O style=borland -f console256 -g'
