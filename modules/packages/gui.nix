# home-modules/packages/gui-packages.nix
{ ... }:
{
  flake.modules.homeManager.gui-packages =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # browsers
        firefox
        brave
        qutebrowser

        # documents & office
        kdePackages.okular
        zathura
        libreoffice
        imagemagick

        # communication
        thunderbird

        # productivity
        rofi
        newsboat
        eduvpn-client
	openpomodoro-cli

        # file management
        pcmanfm
        imv

        # remote & connectivity
        tigervnc
        remmina
        nextcloud-client

        # misc
        scrcpy
        keepassxc
      ];
    };
}
