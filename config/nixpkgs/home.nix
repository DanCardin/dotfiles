with import <nixpkgs> {};

{ config, pkgs, fetchFromGitHub, ... }:

let
  extraNodePackages = import ./node/default.nix {};
  esbonio = pkgs.python39Packages.buildPythonPackage rec {
    pname = "esbonio";
    version = "0.8.0";

    src = pkgs.python39Packages.fetchPypi {
      inherit pname version;
      sha256 = "+jlnF1t2OyaPsr1S8ULF54jm0FOm61siCHvs17p1gX8=";
    };

    doCheck = false;

    meta = {
      homepage = "https://swyddfa.github.io/esbonio/";
      description = "sphinx language server";
    };

    buildInputs = [ pkgs.python39Packages.sphinx pkgs.python39Packages.appdirs pkgs.python39Packages.pygls ];
  };
in 
{
  imports = [
    ./base.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    (pkgs.writeScriptBin "nixf" ''
      exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
    '')

    # Better userland for macOS
    coreutils
    moreutils
    findutils
    gnugrep
    gnused
    wget
    fzy

    watchexec
    postgresql_12
    ninja
    zlib
    readline
    openconnect

    python310
    /* python311 */
    exiftool

    python39Packages.ptpython
    python39Packages.pgcli
    python39Packages.pipx
    /* python39Packages.pylsp-mypy */

    /* pkgs.python37Packages.python-lsp-server
    pkgs.python37Packages.pylsp-mypy
    pkgs.python37Packages.pyls-isort
    pkgs.python37Packages.python-lsp-black
    pkgs.python37Packages.pyls-flake8 */
    /* esbonio */

    # Editor LSP tools
    nodePackages.prettier
    nodePackages.pyright
    nodePackages.typescript-language-server
    nodePackages.diagnostic-languageserver
    nodePackages.eslint_d
    nodePackages.fixjson
    extraNodePackages.lua-fmt
    extraNodePackages.write-good
    extraNodePackages.nginxbeautifier
    extraNodePackages.rustywind
    extraNodePackages.markdownlint
    extraNodePackages."@fsouza/prettierd"
    extraNodePackages."@volar/vue-language-server"

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
    /* git */
    watch
    gnupg
    jq
    graphviz
    terraform
    /* poetry */
    go
    deno

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
    /* neovim-remote */

    # magic-wormhole
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
