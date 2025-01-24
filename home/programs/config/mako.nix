{config, ...}: let
  palette = {
    background = "282c34";
    secondary_accent = "89b4fa";
    tertiary_accent = "f5f5f5";
  };
  fontType = "RobotoMono Nerd Font 12";
in {
  services.mako = {
    enable = true;
    iconPath = "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark";
    font = fontType;
    padding = "10,20";
    anchor = "top-right";
    width = 460;
    height = 190;
    borderSize = 1;
    defaultTimeout = 12000;
    backgroundColor = "#${palette.background}dd";
    borderColor = "#${palette.secondary_accent}dd";
    textColor = "#${palette.tertiary_accent}dd";
    layer = "overlay";
  };
}
