{ ... }:
{
  flake.modules.homeManager.cernbox =
    { pkgs, lib, ... }:
    {
      home.packages = [
        (pkgs.appimageTools.wrapType2 {
          pname = "cernbox";
          version = "5.3.2";
          src = pkgs.fetchurl {
            url = "https://cernboxdistr.web.cern.ch/Linux/repo/cernbox-5.3.2.15486-x86_64.AppImage";
            sha256 = "sha256-HK7WrgtzqXe8aYUl1dQjIvDoM4XPGVE7N/VtFwvYjTc=";
          };
          extraPkgs =
            pkgs: with pkgs; [
              qt5.qtwayland
            ];
          extraInstallCommands = ''
            source ${pkgs.makeWrapper}/nix-support/setup-hook
            wrapProgram $out/bin/cernbox \
              --set QT_QPA_PLATFORM xcb
          '';
        })
      ];
    };
}
