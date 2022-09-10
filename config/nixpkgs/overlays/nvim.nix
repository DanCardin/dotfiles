let
  pkgs = import <nixpkgs> {};
in
self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "ac10c0f4184a04c82b8e039c546ab32f4a629e30";
      sha256 = "8sf3mgJ4aRFilggJDvVHU04ZTix3tfO4zzdAsdHrkgc=";
    };
  });
}
