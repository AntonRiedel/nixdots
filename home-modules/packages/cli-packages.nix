{ pkgs, ... }:
{
  home.packages = with pkgs; [
    htop
    fd
    ripgrep
    bat
    trash-cli
    xdg-utils
    sshpass
    zip
    unzip
    stow
    stylua
    gnumake
    cmake
    xclip
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    pyright
    lua51Packages.lua
    luajitPackages.lua-lsp
    luajitPackages.luarocks
    lua-language-server
    nixfmt-rfc-style
    black
    clang-tools
    clang
    texlab
    nodePackages.bash-language-server
    nixd
    root
  ];
}
