alias attach='tmux a -dt 0'
alias tmux='TERM=screen-256color tmux -2 -f "$XDG_CONFIG_HOME"/tmux/config'
alias vim="nvim"
alias vi="nvim"
alias freeze="pip freeze > requirements.txt"
alias activate="source .venv/bin/activate"

# alias pip="python -m pip"
alias pip="python -m pip"
alias p="ptpython || python"
alias ppytest="pytest --pdb --pdbcls=ptpdb:PtPdb --capture=no"

alias z='wd'
alias du='dust'
alias psx='procs'

alias ag='rg'
alias ls='exa --ignore-glob __pycache__'
alias diff='prettydiff'

# Git
alias ga='git add'
alias gd='git diff'
alias gc='git commit'
alias go='git checkout'
alias gs='git status'
alias gb='git branch'
alias gp='git push origin'
alias gpom='git pull --rebase origin master'

alias unescape='sed $'"'"'s/\\\\n/\\\n/g'"'"

alias ll='ls -la'
alias tree='exa -T --git-ignore'

# Nix
alias nixfind='nix-env -qaP | grep -i'


# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
