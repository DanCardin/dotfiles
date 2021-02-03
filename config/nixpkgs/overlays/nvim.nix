let
  pkgs = import <nixpkgs> {};

  # # Needed until https://github.com/NixOS/nixpkgs/pull/102763 lands in nixpkgs-unstable
  # tree-sitter = pkgs.tree-sitter.overrideAttrs (old: {
  #   version = "0.17.3";
  #   sha256 = "sha256-uQs80r9cPX8Q46irJYv2FfvuppwonSS5HVClFujaP+U=";
  #   cargoSha256 = "sha256-fonlxLNh9KyEwCj7G5vxa7cM/DlcHNFbQpp0SwVQ3j4=";
  #
  #   postInstall = ''
  #     PREFIX=$out make install
  #   '';
  #
  #   buildInputs = old.buildInputs
  #     ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [ pkgs.darwin.apple_sdk.frameworks.Security ];
  #
  #   meta = old.meta // { broken = false; };
  # });
in
self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "cc1851c9fdd6d777338bea2272d2a02c8baa0fb1";
      sha256 = "05659gqaczsschrhbr9q1xbq6bgqai97jpkb2axp3rb2hxv30d1c";
    };
    buildInputs = old.buildInputs ++ [ pkgs.tree-sitter ];
  });
}
