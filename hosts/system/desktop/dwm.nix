{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with builtins; let
  cfg = config.desktop;
in {
  config = mkIf (cfg.environment == "dwm") {
    services.xserver = {
      enable = true;
      libinput.enable = true;
      layout = "us";
      xkbVariant = "";
      windowManager.dwm = {
        enable = true;
      };
      displayManager = {
        lightdm = {
          enable = true;
          greeters.enso.enable = true;
          background = pkgs.nixos-artwork.wallpapers.nineish-dark-gray.gnomeFilePath;
        };
        defaultSession = "none+dwm";
      };

      # Exlude the following packages from the Xorg server
      excludePackages = [
        pkgs.nano
        pkgs.xterm
      ];
    };
    # Enable gnome-keyring in PAM
    security.pam.services.lightdm.enableGnomeKeyring = true;
  };
}
