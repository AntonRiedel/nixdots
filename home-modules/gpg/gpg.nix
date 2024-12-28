{ pkgs, ... }:
{

  programs = {
    gpg = {
      enable = true;
      homedir = builtins.toPath "/home/anton/Secfiles/gnupg/.config/gnupg";
    };

    password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [
        exts.pass-otp
        exts.pass-checkup
      ]);
      settings = {
        PASSWORD_STORE_DIR = "$HOME/Secfiles/pass/.local/share/password-store";
      };
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-qt;
    };
  };

  # fix passff
  home.file.".mozilla/native-messaging-hosts/passff.json".source =
    "${pkgs.passff-host}/share/passff-host/passff.json";

}
