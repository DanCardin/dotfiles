self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "94b7ff730a1914c14f347f5dc75175dc34a4b3f5";
      sha256 = "15fpihn2xbdzp4nb1sgni0wyr94q89y45jaxfmzh6vjbx8f76m0w";
    };
    buildInputs = old.buildInputs ++ [ super.utf8proc ];
  });
}
