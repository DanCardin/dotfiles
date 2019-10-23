alias attach='tmux a -dt 0'
alias tmux="env TERM=screen-256color tmux -2"
alias vim="nvim"
alias vi="nvim"
alias freeze="pip freeze > requirements.txt"
alias activate="source .venv/bin/activate"

# alias pip="python -m pip"
alias ppytest="pytest --pdb --pdbcls=ptpdb:PtPdb --capture=no"

alias z='wd'
alias du='dust'

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

alias unescape='sed $'"'"'s/\\\\n/\\\n/g'"'"

alias ag='rg'
alias ls='exa --ignore-glob __pycache__'
alias ll='ls -la'
alias tree='exa -T --ignore-glob __pycache__'

pcat=alias c='pygmentize -O style=borland -f console256 -g'


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
