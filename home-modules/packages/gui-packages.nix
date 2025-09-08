{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.firefox
    # pkgs.chromium
    pkgs.brave
    pkgs.qutebrowser
    # pkgs.kitty
    pkgs.ghostty

    pkgs.qt6.full
    pkgs.kdePackages.okular
    pkgs.pavucontrol
    pkgs.pulsemixer

    pkgs.zoom-us

    pkgs.rofi-wayland
    # pkgs.rofi

    # pkgs.passff-host
    pkgs.thunderbird
    pkgs.eduvpn-client
    pkgs.mattermost-desktop
    pkgs.nextcloud-client
    pkgs.newsboat
    pkgs.sxiv

    pkgs.tigervnc

    # pkgs.grim
    # pkgs.slurp
    # pkgs.swappy

    pkgs.scrcpy
    pkgs.zathura
    # pkgs.kdePackages.okular
    pkgs.pcmanfm
    pkgs.libreoffice
    pkgs.imagemagick
    pkgs.xournalpp
    pkgs.rnote
  ];

}
