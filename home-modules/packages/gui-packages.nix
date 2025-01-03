{ pkgs, pkgs-unstable, ... }:
{
  home.packages = [
    pkgs.firefox
    pkgs.chromium
    pkgs.qutebrowser
    pkgs.kitty
    pkgs.pavucontrol
    pkgs.pulsemixer
    pkgs.zoom-us

    pkgs.passff-host
    pkgs.thunderbird
    pkgs.mattermost-desktop
    pkgs.nextcloud-client
    pkgs.remmina
    pkgs.newsboat
    pkgs.sxiv

    pkgs.tigervnc
    pkgs.scrcpy
    pkgs.zathura
    pkgs.kdePackages.okular
    pkgs.pcmanfm
    pkgs.libreoffice
    pkgs.imagemagick
    pkgs.arandr
    pkgs.autorandr
    pkgs.xournalpp
  ];

}
