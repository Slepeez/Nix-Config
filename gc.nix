{ config, pkgs, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      keep-outputs = true;
      keep-derivations = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      
      options = "--delete-older-than 14d"; 
    };
  };
}