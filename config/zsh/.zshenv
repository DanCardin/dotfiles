# export SSL_CERT_FILE="$HOME/.nix-profile/etc/ssl/certs/ca-bundle.crt"

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# AWSCLI
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AWS_CLI_HISTORY_FILE="$XDG_CACHE_HOME/aws/history"

# Docker
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker

# GPG
export GNUPGHOME=$XDG_DATA_HOME/gnupg

# Minikube
export MINIKUBE_HOME=$XDG_DATA_HOME/minikube

# NPM
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_RUNTIME_DIR/npm

# PSQL
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGCLIENTENCODING=utf-8

# PTPYTHON
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/startup

# Rust
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup

# WD
export WD_CONFIG=$XDG_DATA_HOME/wd/config

# ZSH
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

export HISTFILE="${XDG_CACHE_HOME}"/bash/history
export HISTFILE=$XDG_CACHE_HOME/zsh/history
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

export BUN_INSTALL="$HOME/.local/share/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "$HOME/.local/share/cargo/env"
