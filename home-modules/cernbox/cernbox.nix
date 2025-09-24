{ pkgs, lib, ... }:
let
  cernboxAppImage = pkgs.fetchurl {
    url = "https://cernboxdistr.web.cern.ch/Linux/repo/cernbox-5.3.2.15486-x86_64.AppImage";
    sha256 = "sha256-HK7WrgtzqXe8aYUl1dQjIvDoM4XPGVE7N/VtFwvYjTc="; # <-- replace me after first build
  };
in
{
  home.packages = [
    pkgs.fuse
    pkgs.appimage-run
  ];

  programs.bash.initExtra = ''
    alias cernbox='QT_QPA_PLATFORM=xcb appimage-run ${cernboxAppImage}'
  '';
  xdg.desktopEntries.cernbox = {
    name = "CERNBox";
    exec = "env QT_QPA_PLATFORM=xcb appimage-run ${cernboxAppImage}";
    icon = "cernbox";
    type = "Application";
    comment = "CERNBox Sync Client";
    categories = [ "Network" ];
  };
}
