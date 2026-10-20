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
            core.editor = "nvim";
            commit.verbose = true;
            init.defaultBranch = "main";
            pull.rebase = true;
            rebase.autoStash = true;
            rerere.enabled = true;
            merge.conflictStyle = "zdiff3";
            fetch.prune = true;
            push.autoSetupRemote = true;
            branch.sort = "-committerdate";
            column.ui = "auto";
          };
        };
      };
    };
}
