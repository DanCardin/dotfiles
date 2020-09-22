{ config, pkgs, ... }@args:
{

  python37Full.withPackages(ps: with ps; [
      jedi
      pynvim
      python-language-server
      pyls-mypy
      pyls-isort
      pyls-black
    ])
}
