self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "8c49e3d50959e24dadd688f56a18f104bd5fd934";
      sha256 = "1qqmfys8hm60j4hgw861yad2x94jadd7247jjgqsxl4ij123hgdg";
    };
    buildInputs = old.buildInputs ++ [ super.utf8proc ];
  });
}
