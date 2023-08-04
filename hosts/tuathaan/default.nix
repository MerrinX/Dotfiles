{
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../common
    ./services
    ./boot.nix
    ./disks.nix
    ./hardware.nix
    ./network.nix
    ./nix.nix
    ./system.nix
    ./user.nix
  ];

  # Set desktop environment and video drivers
  desktop.environment = "dwm";
  services.xserver = {
    videoDrivers = ["intel" "displaylink"];
    displayManager = {
      # TODO: ${pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-1 and the rest of arandr output
      # xrandr --setprovideroutputsource 2 0 This is after run xrandr --listproviders to identify the provider
      sessionCommands = ''
        ${lib.getBin pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all
      '';
    };
  };

  # Set audio server
  sys.audio.server = "pulse";

  # Remove if you wish to disable unfree packages for your system
  nixpkgs.config.allowUnfree = true;

  # NixOS release to be compatible with for staeful data such as databases.
  system.stateVersion = "23.05";
}
