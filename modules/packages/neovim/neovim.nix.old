{ ... }:
{
  flake.modules.homeManager.neovim =
    { pkgs, ... }:
    {
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        plugins = with pkgs.vimPlugins; [
          (nvim-treesitter.withPlugins (
            p: with p; [
              bash
              c
              cpp
              diff
              json
              latex
              lua
              luadoc
              markdown
              python
              query
              regex
              toml
              vim
              vimdoc
              xml
              yaml
              nix
            ]
          ))
        ];

      };

      home.packages = with pkgs; [
        tree-sitter
        lua51Packages.lua
        lua51Packages.luarocks
      ];

      xdg.configFile."nvim" = {
        source = ./nvim;
        recursive = true;
      };
    };
}
