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
    parallel

    watchexec
    postgresql
    zlib
    readline

    # Working python
    # python37Packages.python-language-server
    # python37Packages.pyls-mypy
    # python37Packages.pyls-black
    # python37Packages.pyls-isort

    (python38.withPackages (ps: with ps; [ requests debugpy ]))

    python39Packages.ptpython
    python39Packages.pgcli
    python39Packages.pipx

    # Editor LSP tools
    nodePackages.prettier
    nodePackages.pyright
    nodePackages.vue-language-server
    nodePackages.typescript-language-server
    nodePackages.diagnostic-languageserver
    nodePackages.yaml-language-server
    pandoc
    yamllint
    shellcheck

    fish
    yarn
    git
    # direnv
    watch
    gnupg
    jq
    graphviz
    terraform
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
