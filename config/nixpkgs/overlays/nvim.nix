let
  pkgs = import <nixpkgs> {};

  # Needed until https://github.com/NixOS/nixpkgs/pull/102763 lands in nixpkgs-unstable
  tree-sitter = pkgs.tree-sitter.overrideAttrs (old: {
    version = "0.17.3";
    sha256 = "sha256-uQs80r9cPX8Q46irJYv2FfvuppwonSS5HVClFujaP+U=";
    cargoSha256 = "sha256-fonlxLNh9KyEwCj7G5vxa7cM/DlcHNFbQpp0SwVQ3j4=";

    postInstall = ''
      PREFIX=$out make install
    '';

    buildInputs = old.buildInputs
      ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [ pkgs.darwin.apple_sdk.frameworks.Security ];

    meta = old.meta // { broken = false; };
  });
in
self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "35325ddac04b1b59b7982797021cdaabdabc87fb";
      sha256 = "0vsl5fjff9zk8c2456z80xvp79cs37ylfhkjbk47spsg1a9xd8sl";
    };
    buildInputs = old.buildInputs ++ [ tree-sitter ];
  });
}
