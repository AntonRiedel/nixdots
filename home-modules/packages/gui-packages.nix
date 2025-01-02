{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.packages = [

    pkgs.firefox
    pkgs-unstable.chromium
    pkgs-unstable.qutebrowser
    # pkgs.kitty

    pkgs.pavucontrol
    pkgs.pulsemixer
    pkgs.zoom-us

    pkgs.rofi-wayland

    # pkgs.passff-host
    pkgs.thunderbird
    pkgs.eduvpn-client
    pkgs.mattermost-desktop
    pkgs.nextcloud-client
    pkgs.remmina
    pkgs.newsboat
    pkgs.sxiv

    pkgs.tigervnc
    pkgs.flameshot
    pkgs.grim
    pkgs.scrcpy
    pkgs.zathura
    pkgs.kdePackages.okular
    pkgs.pcmanfm
    pkgs.libreoffice
    pkgs.imagemagick
    pkgs.xournalpp
  ];

}
