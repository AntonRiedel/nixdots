{ pkgs, lib, ... }:
{
  # more packages
  home.packages = with pkgs; [

    # general tools
    firefox 
    chromium
    passff-host
    thunderbird
    mattermost-desktop
    remmina
    newsboat
    sxiv
    nextcloud-client
    arandr
    tigervnc
    scrcpy
    zathura
    kdePackages.okular
    pcmanfm
    qutebrowser
    libreoffice
    pulsemixer
    imagemagick
    qrencode

    # dev tools

    lua51Packages.lua
    lua51Packages.luarocks
    fswatch
    nerdfonts

    clang
    cmake 
    gnumake
    openssl
    texlab
    nodePackages.bash-language-server
    # nodePackages.pyright
    clang-tools
    lua-language-server
    # root
    ansible
    # jupyter-all
    # mathematica

    # (python3.withPackages (p: with p; [ numpy scipy awkward uproot matplotlib jupyterlab ]))
    # (node.withPackages (p: with p; [ bash-language pyright ]))
  ];

  programs = {
    gpg = {
      enable = true;
      homedir = builtins.toPath "/home/anton/Secfiles/gnupg/.config/gnupg";
    };
    password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [ exts.pass-otp exts.pass-checkup ]);
      settings = { PASSWORD_STORE_DIR = "$HOME/Secfiles/pass/.local/share/password-store"; };
    };
    git = {
      enable = true;
      userEmail = "anton.riedel@cern.ch";
      userName = "Anton Riedel";
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      pinentryPackage= pkgs.pinentry-qt;
    };
  };

  # fix passff
  home.file.".mozilla/native-messaging-hosts/passff.json".source = "${pkgs.passff-host}/share/passff-host/passff.json";

  # configure qtile
  xdg.configFile."qtile/config.py".source = ./qtile/config.py;
  xdg.configFile."qtile/autostart.sh".source = ./qtile/autostart.sh;

  # configure kitty
  xdg.configFile."kitty/kitty.conf".source = ./kitty/kitty.conf;

  home.file = {
    ".config/tmuxp" = {
      source = ./tmuxp;
      recursive = true;
    };
  };

  home.sessionVariables = {
    ALICE = "$HOME/alice";
    ANALYSIS = "$HOME/nextcloud/PhD/ALICE/analysis";
  };

}
