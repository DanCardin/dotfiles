function mk() {
  mkdir -p "$(dirname "$1")" && touch "$1" ;
}

function setup {
  FILE=".envrc"
  /bin/cat <<EOM >$FILE
use_nix
if test -f ".venv/bin/activate"; then
  source .venv/bin/activate
fi
unset PS1
export SOURCE_DATE_EPOCH=315532800
EOM

  FILE="shell.nix"
  /bin/cat <<EOM >$FILE
with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "$1";
  buildInputs = with pkgs; [
    pkgconfig
    openssl
    postgresql
    python38Full
  ];
}
EOM

  direnv allow
  venv
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

function remote-git {
  export GIT_WORK_TREE=$(corpus --nearest --source-path -n git -e git)
  export GIT_DIR=$(corpus --nearest -n git -e git)
}

function local-git {
  unset GIT_DIR
  unset GIT_WORK_TREE
}

function pip() {
  export VENV_NAME="$(pwd)/.venv"
  export VIRTUAL_ENV="$VENV_NAME"

  if [ ! -d "$VENV_NAME" ]; then
    python -m venv "$VENV_NAME"
  fi
  command pip $@
}

function venv() {
  export VENV_NAME="$(pwd)/.venv"
  export VIRTUAL_ENV="$VENV_NAME"

  if [ ! -d "$VENV_NAME" ]; then
    python$1 -m venv "$VENV_NAME"
  fi
  source .venv/bin/activate
}
