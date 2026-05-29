{ ... }:
{
  flake.modules.homeManager.cernbox =
    { pkgs, lib, ... }:
    let
      cernbox-appimage = pkgs.appimageTools.wrapType2 {
        pname = "cernbox";
        version = "5.3.2";
        src = pkgs.fetchurl {
          url = "https://cernboxdistr.web.cern.ch/Linux/repo/cernbox-5.3.2.15486-x86_64.AppImage";
          sha256 = "sha256-HK7WrgtzqXe8aYUl1dQjIvDoM4XPGVE7N/VtFwvYjTc=";
        };
        extraPkgs =
          pkgs: with pkgs; [
            libsecret
          ];
      };
    in
    {
      home.packages = [
        (pkgs.writeShellScriptBin "cernbox" ''
          # KDSingleApplication puts its socket + lock at:
          #   /tmp/kdsingleapp-<uid>-<session>-cernbox{,.lock}
          # If nothing is listening on it, the files are stale — remove them.
          if ! ss -lx 2>/dev/null | grep -q "kdsingleapp.*cernbox"; then
            rm -f /tmp/kdsingleapp-*-cernbox /tmp/kdsingleapp-*-cernbox.lock 2>/dev/null
          fi
          export QT_QPA_PLATFORM=xcb
          exec ${cernbox-appimage}/bin/cernbox "$@"
        '')
      ];
    };
}
