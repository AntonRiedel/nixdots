{...}: {
  flake.modules.homeManager.gui-packages = {pkgs, ...}: {
    home.packages = with pkgs; [
      # documents & office
      kdePackages.okular
      zathura
      libreoffice
      imagemagick

      # productivity
      rofi
      openpomodoro-cli
      liferea

      # file management
      pcmanfm
      imv

      # remote & connectivity
      nextcloud-client
      remmina

      # misc
      scrcpy
      keepassxc
    ];
  };
}
