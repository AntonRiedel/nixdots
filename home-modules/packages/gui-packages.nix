{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    pavucontrol
    pulsemixer
    firefox
    chromium

    passff-host
    thunderbird
    mattermost-desktop
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
  ];
}
