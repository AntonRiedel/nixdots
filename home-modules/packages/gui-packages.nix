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
    # pkgs.xdg-desktop-portal
    # pkgs.kdePackages.xdg-desktop-portal-kde

    # pkgs.rofi-wayland
    pkgs.rofi

    # pkgs.passff-host
    pkgs.thunderbird
    pkgs.eduvpn-client
    pkgs.mattermost-desktop
    pkgs.nextcloud-client
    pkgs.remmina
    pkgs.newsboat
    pkgs.sxiv

    pkgs.tigervnc

    pkgs.grim
    pkgs.slurp
    pkgs.swappy

    pkgs.scrcpy
    pkgs.zathura
    pkgs.kdePackages.okular
    pkgs.pcmanfm
    pkgs.libreoffice
    pkgs.imagemagick
    pkgs.xournalpp

    # x11 applications
    pkgs.xcompmgr
    pkgs.xdotool
    pkgs.xorg.xset
    pkgs.flameshot
    pkgs.xorg.xrandr
    pkgs.arandr
    pkgs.autorandr
    pkgs.xclip

  ];

}
