{ config, pkgs, ... }:

{
  home.username = "arthur";
  home.homeDirectory = "/home/arthur";

  # State version for tracking backward compatibility points
  home.stateVersion = "26.05"; 

  # Global user packages
  home.packages = with pkgs; [
    fzf
    ripgrep
    htop
  ];

  # Zsh shell configuration with recommended plugins
  programs.zsh = {
    enable = true;
    
    # Enable essential interactive shell features
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    # History configuration
    history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreAllDups = true;
    };

    # Useful daily shell aliases
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      v = "nvim";
      g = "git";
      
      # Quick system rebuild aliases
      nix-switch = "sudo nixos-rebuild switch --flake .#Nix";
      nix-clean = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +5 && nix-store --gc";
    };
    

    # Additional configurations appended to .zshrc
    initContent = ''
      # Bind up and down arrow keys for substring history search (using fzf if available)
      bindkey '^[[A' up-line-or-search
      bindkey '^[[B' down-line-or-search
    '';
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
