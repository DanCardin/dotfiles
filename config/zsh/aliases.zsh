alias attach='tmux a -dt 0'
alias tmux='TERM=screen-256color tmux -2 -f "$XDG_CONFIG_HOME"/tmux/config'
alias vim="nvim"
alias vi="nvim"
alias freeze="pip freeze > requirements.txt"
alias activate="source .venv/bin/activate"

# alias pip="python -m pip"
alias pip="python -m pip"
alias ptpython="python -m ptpython --config-file ~/.config/ptpython/config.py"
alias ppytest="pytest --pdb --pdbcls=ptpdb:PtPdb --capture=no"

alias z='wd'
alias du='dust'
alias psx='procs'
alias g='lazygit'

alias ag='rg'
alias ls='eza --ignore-glob __pycache__'
alias diff='prettydiff'
alias http='rural'

# Git
alias stash='git stash'
alias ga='git add'
alias gd='git diff'
alias go='git checkout'
alias gc='git commit'
alias gca='git commit --amend'
alias gs='git status'
alias gb='git branch'
alias gp='git push origin'
alias grb='git rebase -i origin/master'
alias gbd='git branch --delete $(git branch --merged main --no-contains main --format="%(refname:short)")'

alias unescape='sed $'"'"'s/\\\\n/\\\n/g'"'"

alias ll='ls -la'
alias tree='eza -T --git-ignore'

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

# Run daemonized container, e.g., $dkd base /bin/echo hello
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

# try to connect every 0.5 secs (modulo timeouts)
sssh(){
  while true; do command ssh "$@"; [ $? -eq 0 ] && break || sleep 0.5; done
}

alias wezupdate='brew upgrade --cask wezterm-nightly --no-quarantine --greedy-latest'

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

alias ku=kubectl
alias kk=kubectx
alias argoui=kubectl -n argo port-forward deployment/argo-server 2746:2746


alias scanimg='trivy image --report summary --severity=HIGH,CRITICAL --ignore-unfixed'

vpn() {
  local email="danc@known.is"
  local server="bos.knownvpn.is"
  if [[ -n "$1" ]]; then
    server="$1.knownvpn.is"
  fi
  openconnect-sso \
    --server="$server" \
    --user "$email" \
    --authgroup ANYCONNECT-AWS-KNOWN-GROUP \
    --browser-display-mode hidden \
    -- \
    --script='vpn-slice known.is schireson.com 23.23.34.213 3.225.50.92 50.16.223.242 54.87.110.183 35.168.186.219 54.83.49.162'
}
