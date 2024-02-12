{ lib, config, pkgs, inputs, ... }:
{
  config = {
    services.xserver.enable = true;

    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [ pkgs.gnome.mutter ];
      extraGSettingsOverrides = ''
        [org.gnome.mutter]
        experimental-features=['scale-monitor-framebuffer']
      '';
	};

    environment.systemPackages = with pkgs; [
      alacritty
      gnome.gnome-tweaks
      vivaldi
    ];

    home-manager.users.${config.homeManager.userName}.home/file = {
      ".config/alacritty/alacritty.toml".source = ../dotfiles/alacritty.toml;
    };
  };
}
