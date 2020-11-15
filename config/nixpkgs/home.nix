{ config, pkgs, fetchFromGitHub, ... }:

{
  imports = [
    ./base.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    # Better userland for macOS
    coreutils
    findutils
    gnugrep
    gnused
    wget
    fzy

    watchexec
    postgresql
    zlib
    readline

    # Working python
    python39
    python39Packages.ptpython

    python37Packages.python-language-server
    python37Packages.pyls-mypy
    python37Packages.pyls-black
    python37Packages.pyls-isort
    python38Packages.pgcli
    python38Packages.sqlparse
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

    skim
    sd
    procs
    # bottom
    tealdeer
    tokei
    exa
    bat
    # prettydiff
    ripgrep
    du-dust

    zsh
    bash
    nodejs
    nodePackages.node2nix
    nodePackages.prettier
    nodePackages.pyright
    nodePackages.diagnostic-languageserver

    tmux
    docker-compose
    neovim-remote

    magic-wormhole
    gitAndTools.delta
    universal-ctags

    # Fonts
    fontconfig
    nerdfonts
  ];

  programs.direnv = {
    enable = true;
    enableNixDirenvIntegration = true;
  };

  programs.alacritty = {
    enable = true;
  };

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    NIX_PATH = "$HOME/git/nixpkgs:nixpkgs=$HOME/git/nixpkgs:nixpkgs-unstable=$HOME/git/nixpkgs";
  };

  xdg = {
    enable = true;
  };
}
