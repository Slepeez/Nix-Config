{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, nix-flatpak }: {
    nixosConfigurations = {
      
      Nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          nixpkgs.nixosModules.nixpkgs
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };

    };
  };
}

