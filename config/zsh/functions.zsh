function mk() {
  mkdir -p "$(dirname "$1")" && touch "$1" ;
}

function reset {
  git fetch
  git checkout "${1:-origin/main}"
  git branch -D "${1:-origin/main}"
  git checkout -b "${1:-origin/main}"
}

function always {
  while true; do $@; done
}

function repeat {
  while $?; do $@; done
}

function remote-git {
  export GIT_WORK_TREE=$(corpus --nearest --source-path -n git -e git)
  export GIT_DIR=$(corpus --nearest -n git -e git)
}

function local-git {
  unset GIT_DIR
  unset GIT_WORK_TREE
}

# function venv() {
#   export VENV_NAME="$(pwd)/.venv"
#   export VIRTUAL_ENV="$VENV_NAME"
#
#   if [ ! -d "$VENV_NAME" ]; then
#     python$1 -m venv "$VENV_NAME"
#   fi
#   source .venv/bin/activate
# }

function mypy() {
  mypy_cache=$(corpus --kind xdg-data --name mypy_cache)
  if [ ! -d "$mypy_cache" ]; then
      mkdir -p "$mypy_cache"
  fi
  command mypy --cache-dir "$mypy_cache" "$@"
}

function pf {
  kubectl -n ${4:-kube-public} port-forward deployment/$1 $2:$3
}

function sql-result {
  # host=$1
  # port=$2
  # user=$3
  # user=$4
  # password=$5
  sql=$1
  args=${@:2}

  result=`psql -F'\t' --no-align $args -c "$sql"`
  echo "$result" | pbcopy
}

function rebase {
  origin=${1:-origin}
  branch=${2:-main}
  git rebase -i $origin/$branch
}

function fetch {
  origin=${1:-origin}
  git fetch $origin
}

function pull {
  branch=${1:-main}
  origin=${2:-origin}
  git pull $origin $branch
}

function rebase {
  git fetch
  git stash
  git rebase -i "origin/${1:-main}"
}

alias push='git push origin "$(git rev-parse --abbrev-ref HEAD)"'

function ssh-keypair {
  name=$1

  # Generate a random password
  password=$(openssl rand -base64 12)

  # Generate RSA key with the random password as passphrase
  openssl genrsa 2048 | openssl pkcs8 -topk8 -v2 des3 -inform PEM -out "$name.p8" -passout pass:"$password"

  # Generate Public Key from RSA key
  openssl rsa -in "$name.p8" -pubout -out "$name.key" -passin pass:"$password"

  truncated_pubkey=$(cat "$name.key" | sed -e '1d' -e '$d' | tr -d '\n')

  printf "Private Key: $(cat "$name.p8" | base64)\n"
  printf "\nPublic Key: $truncated_pubkey\n"
  printf "\nPassphrase: $password\n"
  rm "$name.p8" "$name.key"
}

vpn() {
  local email="danc@known.is"
  local server="nyc.knownvpn.is"
  if [[ -n "$1" ]]; then
    server="$1.knownvpn.is"
  fi
  openconnect-sso \
    -l WARNING \
    --server="$server" \
    --user "$email" \
    --authgroup ANYCONNECT-AWS-KNOWN-GROUP \
    --browser-display-mode hidden \
    -- \
    -q \
    --script='vpn-slice -S --no-ns-hosts engineering.docs.known.is known.is schireson.com airflow.skeptic.known.is argocd.amc.afterburner.known.is argocd.dev.media.schireson.com bastion.prod.paramount.afterburner.known.is 23.23.0.0/16 3.255.0.0/16 50.16.0.0/16 54.0.0.0/8 34.0.0.0/8 35.0.0.0/8 54.0.0.0/8 52.0.0.0/8 50.16.223.242 3.225.50.92 52.0.0.0/8'
}
