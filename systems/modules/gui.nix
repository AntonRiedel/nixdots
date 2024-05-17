{ pkgs, ... }:
{
  # window manager
  services.xserver.enable = true;
  services.xserver.xkb.layout = "eu";
  services.xserver.videoDrivers = [ "amdgpu" "displaylink" "modesetting" ];
  services.xserver.displayManager.lightdm.enable=true;
  services.xserver.windowManager.qtile.enable=true;
  services.xserver.libinput.enable = true;

  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
  # xdg = {
  #   portal = {
  #     enable = true;
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-wlr
  #       xdg-desktop-portal-gtk
  #     ];
  #   };
  # };
  # security.polkit.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  # sound
  services.pipewire = {
    enable=true;
    pulse.enable=true;
  };

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # gpg
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

}
