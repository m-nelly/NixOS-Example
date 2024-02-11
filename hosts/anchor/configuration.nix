# configuration.nix
{ config, pkgs, ... }:
{
  imports = [
      ./hardware-configuration.nix
      ../../modules/system.nix
      ../../modules/home-manager.nix
	  ../../modules/desktop.nix
    ];
  
  homeManager.userName = "mnelly";
  networking.hostName = "anchor";
  system.stateVersion = "23.11";
}
