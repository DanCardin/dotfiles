{
  description = "Home Manager configurations";

  inputs = {
    nixpkgs.url = "flake:nixpkgs";
    homeManager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, homeManager }: {
    homeConfigurations = {
      "danc@BOS-MAC-005" = homeManager.lib.homeManagerConfiguration {
        configuration = import ./home.nix;
        system = "x86_64-darwin";
        homeDirectory = "/Users/danc";
        username = "danc";
        stateVersion = "22.05";
      };
    };
  };
}
