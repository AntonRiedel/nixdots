{ pkgs, ... }:
{
  # window manager
  services.xserver.enable = true;
  services.xserver.xkb.layout = "eu";
  services.xserver.videoDrivers = [ "amdgpu" "displaylink" "modesetting" ];
  services.xserver.displayManager.lightdm.enable=true;
  services.xserver.windowManager.qtile.enable = true;
  services.libinput.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  # sound
  security.rtkit.enable = true;
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
