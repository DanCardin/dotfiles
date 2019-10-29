function mk() {
  mkdir -p "$(dirname "$1")" && touch "$1" ;
}

function localdocker() {
  unset DOCKER_HOST
  unset DOCKER_TLS_VERIFY
  unset PYTEST_MOCK_RESOURCES_HOST
}

function remotedocker() {
  export DOCKER_HOST=tcp://desktop:2376
  export DOCKER_TLS_VERIFY=1
  export PYTEST_MOCK_RESOURCES_HOST=desktop
}

function venv() {
  if [ ! -d ".venv" ]; then
    python -m venv .venv
  fi
  source .venv/bin/activate
}
