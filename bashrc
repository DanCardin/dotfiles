TERM=screen-256color

alias tmux="tmux -2"

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

export WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
PROJECT_HOME='/home/capstone/Capstone'
source /usr/local/bin/virtualenvwrapper.sh
