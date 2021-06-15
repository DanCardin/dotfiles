let
  pkgs = import <nixpkgs> {};
in
self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "988f88c24e83c37e1dc011e3561fb505ca7b8706";
      sha256 = "tIPobA9gTFAcSUeOlhXs1BnHv37dkotd41DxnUwaZ0k=";
    };
    buildInputs = old.buildInputs ++ [ pkgs.tree-sitter ];
  });
}
