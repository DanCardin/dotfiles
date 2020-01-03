{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Basic utilities
    fd
    htop
    ripgrep
    unzip

    # Encryption
    gnupg
  ];

  programs.home-manager = {
    enable = true;
  };
}
