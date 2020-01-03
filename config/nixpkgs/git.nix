{ pkgs, ... }:

{
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Dan Cardin";
    userEmail = "ddcardin@gmail.com";
  };
}
