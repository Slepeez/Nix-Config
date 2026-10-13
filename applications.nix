{config, pkgs , lib , ...}:
{
  programs = {
    firefox.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    
  };
  environment.systemPackages = with pkgs; [
    vim 
    wget
    vscode
    fastfetch
    git
    google-chrome
    nixd
    nixfmt
    ghostty
    vlc 
    gnome-tweaks
    gnome-extension-manager
  ];
}