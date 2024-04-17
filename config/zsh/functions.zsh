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

function pytest() {
  pytest_cache=$(corpus --kind xdg-data --name pytest_cache)
  if [ ! -d "$pytest_cache" ]; then
      mkdir -p "$pytest_cache"
  fi
  command pytest -o "cache_dir=$pytest_cache" "$@"
}

function pf {
  kubectl -n ${4:-kube-public} port-forward deployment/$1 $2:$3
}
