self: super: {
  poetry = super.poetry.overrideAttrs (old: {
    version = "1.1.0a3";
    # src = super.fetchFromGitHub {
    #   owner = "python-poetry";
    #   repo = "poetry";
    #   rev = "1.1.0a3";
    #   sha256 = "1n30q95ipa6jac503ba6ispbf9vf8w7pzma21yfvip6ccd892dxm";
    # };
  });
}
