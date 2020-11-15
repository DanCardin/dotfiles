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
      pkgs.python37Packages.python-language-server
      pkgs.python37Packages.pyls-mypy
      pkgs.python37Packages.pyls-isort
      pkgs.python37Packages.pyls-black
    ]);
  };
}
