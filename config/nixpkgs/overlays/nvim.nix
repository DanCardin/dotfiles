self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "b39edb5b605b545843482c70a3a3d03e2331a059";
      sha256 = "1xmfs8i04f84vgicnjjfzhm5iakz4dpdqa78njny6hhk3yway3az";
    };
    buildInputs = old.buildInputs ++ [ super.utf8proc ];
  });
}
