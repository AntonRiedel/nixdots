{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    pavucontrol
    pulsemixer
    firefox
    chromium
    zoom-us

    passff-host
    thunderbird
    mattermost-desktop
    nextcloud-client
    remmina
    newsboat
    sxiv

    tigervnc
    scrcpy
    zathura
    kdePackages.okular
    pcmanfm
    libreoffice
    imagemagick
    arandr
    autorandr
  ];
}
