let
  pkgs = import <nixpkgs-unstable> {};
in
self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "e5f4394eb7a27a9e5eaab088e6acf5553c64cf59";
      sha256 = "qOWISItwO+shEndsaDsDPvAyOToCsDsyGsu9OHiCBuc=";
    };
  });
}
