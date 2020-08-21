{ config, pkgs, ... }@args:
{

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

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
