{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
      url = "github:nix-community/home-manager/master"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-flatpak }: {
    nixosConfigurations = {
      
      Nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
        ];
        home-manager.nixosModules.home-manage = {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          
          home-manager.users.arthur = import ./home.nix; 
        }
      };

    };
  };
}

