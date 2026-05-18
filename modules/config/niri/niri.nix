# modules/niri.nix
{ ... }:
{
  flake.modules.nixos.niri =
    { pkgs, ... }:
    {
      programs.niri.enable = true;

      environment.sessionVariables.NIXOS_OZONE_WL = "1";

      fonts.packages = with pkgs; [
        fira-code
        fira-code-symbols
        font-awesome
      ];

      services.displayManager.ly.enable = true;
      services.tlp.enable = false;
      services.gnome.gnome-keyring.enable = false;
      services.tuned.enable = true;
      services.upower.enable = true;

      environment.systemPackages = with pkgs; [
        wayland
        wayland-protocols
        wayland-utils
        xwayland
        xwayland-satellite
        swaybg
        wl-mirror
        iio-sensor-proxy
        adwaita-icon-theme
        wl-clipboard
        grim
        slurp
        swappy
        cliphist
        nwg-clipman
        kanshi
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        unstable.noctalia-shell
      ];
    };

  flake.modules.homeManager.niri =
    { pkgs, ... }:
    {
      home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
      xdg.configFile."niri/config.kdl".source = ./config.kdl;
    };
}
