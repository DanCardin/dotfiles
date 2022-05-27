{ config, pkgs, ... }@args:

{

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    withNodeJs = false;
    withPython3 = true;
    withRuby = false;

    extraPython3Packages = (ps: with ps; [
      jedi
      pynvim
      debugpy
    ]);

    extraConfig = "lua require 'self.init'";
  };
}
