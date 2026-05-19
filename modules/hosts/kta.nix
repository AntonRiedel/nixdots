{ inputs, config, ... }:
let
  hm = config.flake.modules.homeManager;
in
{
  configurations.homeManager."ga45can@kta" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = config.pkgs;
    extraSpecialArgs = { inherit inputs; };
    modules = [
      hm.ga45can
      hm.bash
      hm.alias
      hm.tmux
      hm.fzf
      hm.neovim
      hm.cli-packages
      {
        nix.package = config.pkgs.nix;
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];
        programs.direnv.enable = true;
      }
    ];
  };
}
