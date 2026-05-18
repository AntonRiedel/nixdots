# home-modules/neovim/neovim.nix
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
        package = pkgs.unstable.neovim-unwrapped;
        plugins = with pkgs.unstable.vimPlugins; [
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

      home.packages = with pkgs.unstable; [
        tree-sitter
        python3Minimal
        lua51Packages.lua
        lua51Packages.luarocks
        # fzf
      ];

      xdg.configFile."nvim" = {
        source = ./nvim;
        recursive = true;
      };
    };
}
