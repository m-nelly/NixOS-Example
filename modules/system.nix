# system.nix
{ config, pkgs, ... }:
{
  nix.settings.experimental-features = ["nix-command" "flakes"]; 
  nixpkgs.config.allowUnfree = true;
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
  networking.networkmanager.enable = true;
  
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
