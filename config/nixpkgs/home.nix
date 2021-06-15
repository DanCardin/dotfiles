{ config, pkgs, fetchFromGitHub, ... }:

let
  extraNodePackages = import ./node/default.nix {};
in 
{
  imports = [
    ./base.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    # Better userland for macOS
    coreutils
    moreutils
    findutils
    gnugrep
    gnused
    wget
    fzy

    watchexec
    postgresql
    ninja
    zlib
    readline
    openconnect

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
    # nodePackages.yaml-language-server
    extraNodePackages.lua-fmt
    extraNodePackages.write-good
    pandoc
    lazygit

    luarocks
    cmake
    aws-vault
    # luaPackages.lua-format

    # yamllint
    shellcheck

    fish
    yarn
    git
    watch
    gnupg
    jq
    graphviz
    terraform
    poetry
    go

    skim
    sd
    # procs
    # bottom
    tealdeer
    tokei
    exa
    bat
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
