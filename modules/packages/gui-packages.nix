{...}: {
  flake.modules.nixos.gui-packages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      keepassxc
      kdePackages.okular
      zathura
      libreoffice
      imagemagick
      pcmanfm
      imv
      nextcloud-client
      remmina
    ];
  };

  flake.modules.homeManager.gui-packages = {pkgs, ...}: {
    home.packages = with pkgs; [
      rofi
      openpomodoro-cli
      liferea
      scrcpy
    ];
  };
}
