{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
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
    shfmt
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
    perl538Packages.LatexIndent
    nodePackages.bash-language-server
    nixd
    root
    entr
    cpplint
  ];
}
