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

    httpie
    watchexec
    # Working python
    postgresql
    # openssl
    zlib
    readline
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
    gcc

    skim
    sd
    procs
    ytop
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

    tmux
    docker-compose
    neovim-remote

    magic-wormhole
    gitAndTools.delta
    universal-ctags

    # Fonts
    fontconfig
    lato
    source-code-pro

    alacritty
  ];

  programs.fish = {
      enable = true;
      promptInit = ''
        setup
      '';
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  # programs.neovim = {
  #   enable = true;
  #   withNodeJs = true;
  #   extraPythonPackages = (ps: with ps; [ jedi pynvim ]);
  #   extraPython3Packages = (ps: with ps; [
  #     jedi
  #     pynvim
  #     python-language-server.overridePythonAttrs (old: rec {
  #       doCheck = false;
  #     })
  #     pyls-mypy
  #     pyls-isort
  #     pyls-black
  #   ]);
  # };

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    NIX_PATH = "$HOME/git/nixpkgs:nixpkgs=$HOME/git/nixpkgs:nixpkgs-unstable=$HOME/git/nixpkgs";
  };

  xdg = {
    enable = true;
  };
}
