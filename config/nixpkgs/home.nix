{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  home.packages = with pkgs; [
    # Better userland for macOS
    coreutils
    findutils
    gnugrep
    gnused
    wget
    fzy

    # Working python
    postgresql
    openssl
    zlib
    readline
    python38Full
    python38Packages.pgcli
    yarn
    awscli
    git
    # direnv
    watch
    gnupg
    jq
    graphviz
    terraform_0_11
    poetry

    cargo

    zsh
    bash
    nodejs
    starship

    tmux
    docker-compose
    neovim-remote

    magic-wormhole

    # Fonts
    fontconfig
    lato
    source-code-pro
  ];

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    extraPythonPackages = (ps: with ps; [ jedi pynvim ]);
    extraPython3Packages = (ps: with ps; [ jedi pynvim ]);
  };

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    NIX_PATH = "$HOME/git/nixpkgs:nixpkgs=$HOME/git/nixpkgs:nixpkgs-unstable=$HOME/git/nixpkgs";
  };

  xdg = {
    enable = true;
  };
}
