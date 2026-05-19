{ inputs, config, ... }:
let
  hm = config.flake.modules.homeManager;
in
{
  configurations.homeManager."anton@silver" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = config.pkgs;
    extraSpecialArgs = { inherit inputs; };
    modules = [
      hm.anton
      hm.bash
      hm.tmux
      hm.fzf
      hm.git
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
