{config, pkgs , lib , ...}:
{
  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.pano
    gnomeExtensions.blur-my-shell
  ];
}