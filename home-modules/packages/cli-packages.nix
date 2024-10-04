{ pkgs, ... }:
{
  home.packages = with pkgs; [
    htop
    fd
    ripgrep
    trash-cli
    xdg-utils
    sshpass
    zip
    unzip
    stow
    stylua
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
    texlab
    ltex-ls
    nodePackages.bash-language-server
    nixd
    root
  ];
}
