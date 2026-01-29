{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.firefox
    pkgs.brave
    pkgs.qutebrowser
    pkgs.ghostty

    pkgs.kdePackages.okular
    pkgs.pavucontrol
    pkgs.pulsemixer

    pkgs.zoom-us

    pkgs.rofi

    # pkgs.passff-host
    pkgs.thunderbird
    pkgs.eduvpn-client
    pkgs.mattermost-desktop
    pkgs.nextcloud-client
    pkgs.newsboat
    pkgs.sxiv

    pkgs.tigervnc

    pkgs.pomodoro-gtk

    pkgs.scrcpy
    pkgs.zathura
    pkgs.pcmanfm
    pkgs.libreoffice
    pkgs.imagemagick
    pkgs.xournalpp
  ];

}
