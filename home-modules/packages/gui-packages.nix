{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.packages = [

    pkgs.firefox
    # pkgs-unstable.chromium
    # pkgs.chromium
    pkgs.brave
    pkgs.qutebrowser
    # pkgs.kitty
    pkgs.ghostty

    pkgs.pavucontrol
    pkgs.pulsemixer

    pkgs.zoom-us

    pkgs.rofi-wayland
    # pkgs.rofi

    # pkgs.passff-host
    pkgs.thunderbird
    pkgs.eduvpn-client
    pkgs.mattermost-desktop
    pkgs-unstable.nextcloud-client
    pkgs.remmina
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
  ];

}
