with import <nixpkgs> {};

{ config, pkgs, fetchFromGitHub, ... }:

let
  extraNodePackages = import ./node/default.nix {};
  unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
in 
{
  imports = [
    ./base.nix
  ];

  # programs.neovim = {
  #   enable = true;
  #   package = unstable.neovim-unwrapped;
  #   vimAlias = true;
  #   withNodeJs = false;
  #   withPython3 = true;
  #   withRuby = false;
  #
  #   extraPython3Packages = (ps: with ps; [
  #     jedi
  #     pynvim
  #     # debugpy
  #   ]);
  # };

  home.stateVersion = "18.09";
  home.packages = with pkgs; [
    (pkgs.writeScriptBin "nixf" ''
      exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
    '')

    # Better userland for macOS
    coreutils moreutils
    findutils
    gnugrep
    gnused
    wget
    fzy

    # watchexec
    ninja
    zlib
    readline
    openconnect

    python310
    exiftool

    python39Packages.ptpython
    python39Packages.pipx

    # Editor LSP tools
    nodePackages.prettier
    nodePackages.pyright
    nodePackages.typescript-language-server
    nodePackages.diagnostic-languageserver
    nodePackages.eslint_d
    nodePackages.fixjson
    /* extraNodePackages.lua-fmt */
    /* extraNodePackages.write-good */
    extraNodePackages.nginxbeautifier
    extraNodePackages.rustywind
    /* extraNodePackages.markdownlint */
    /* extraNodePackages."@fsouza/prettierd" */
    extraNodePackages."@volar/vue-language-server"

    pandoc
    lazygit

    sumneko-lua-language-server
    luarocks
    cmake
    aws-vault

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
    go
    deno

    # rustup
    skim
    sd
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

    gitAndTools.delta

    # Fonts
    fontconfig
    nerdfonts
  ];

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    NIX_PATH = "$HOME/git/nixpkgs:nixpkgs=$HOME/git/nixpkgs:nixpkgs-unstable=$HOME/git/nixpkgs";
  };

  xdg = {
    enable = true;
  };
  manual.manpages.enable = false;
}
