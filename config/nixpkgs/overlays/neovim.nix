self: super: {
  neovim = super.src.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "master";
      sha256 = "a8f784192404864744c323e4394292467c3c0ca7";
    };
}
