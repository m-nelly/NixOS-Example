# configuration.nix
{ config, pkgs, ... }:
{
  imports = [
      ./hardware-configuration.nix
      ../../modules/system.nix
      ../../modules/home-manager.nix
    ];
  
  homeManager.userName = "mnelly";
  networking.hostName = "homelab";
  services.openssh.enable = true;
  system.stateVersion = "23.11";
}
