{ ... }:
{
  flake.modules.homeManager.cli-packages =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        nh
	devenv
        htop
        fd
        ripgrep
        rip2
        yazi
        zip
        unzip
      ];
    };
}
