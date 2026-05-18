# modules/hyprland.nix
{ ... }:
{
  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
      programs.uwsm = {
        enable = true;
        package = pkgs.unstable.uwsm;
      };
      programs.hyprland = {
        enable = true;
        package = pkgs.unstable.hyprland;
        withUWSM = true;
        portalPackage = pkgs.unstable.xdg-desktop-portal-hyprland;

      };
      environment.sessionVariables.NIXOS_OZONE_WL = "1";
      fonts.packages = with pkgs; [
        fira-code
        fira-code-symbols
        font-awesome
      ];

      programs.regreet = {
        enable = true;
      };

      # services.displayManager.ly.enable = true;
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
        pkgs.unstable.noctalia-shell
      ];
    };

  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.unstable.hyprland;
      };
      home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
      xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
    };
}
