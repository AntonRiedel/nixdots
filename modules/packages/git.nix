{ ... }:
{
  flake.modules.homeManager.git =
    { ... }:
    {
      programs = {
        delta.enable = true;
        delta.enableGitIntegration = true;
        git = {
          enable = true;
          settings = {
            user = {
              name = "Anton Riedel";
              email = "anton.riedel@tum.de";
            };
          };
        };
      };
    };
}
