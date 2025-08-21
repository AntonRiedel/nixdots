{ pkgs, ... }:
{
  # Enable the GNOME desktop environment
  # it uses wayland by default even though it is defined under xserver
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-photos
      gnome-tour
      gedit
      cheese # webcam tool
      gnome-music
      epiphany # web browser
      geary # email reader
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ]
  );

  environment.systemPackages = with pkgs; [ gnomeExtensions.forge ];

  # disable pulseaudio explicitly
  hardware.pulseaudio.enable = false;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "eu";
    variant = "";
  };
}
