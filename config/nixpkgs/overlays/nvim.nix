let
  pkgs = import <nixpkgs> {};
in
self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (old: {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "abc157a6fd5ed2f09271ee3dd75d23d9ec3e0313";
      sha256 = "WTNeIKwfRMy+K4N+BuD2W5IPaaqidrhhbOD7Qp3xjCM=";
    };
  });
}
