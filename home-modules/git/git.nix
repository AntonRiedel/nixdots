{ ... }:
{
  programs = {
    git = {
      enable = true;
      delta.enable = true;
      extraConfig = {
        user = {
          name = "Anton Riedel";
          email = "anton.riedel@tum.de";
        };
      };
      includes = [
        {
          contentSuffix = "o2";
          condition = "gitdir:~/alice/";
          contents = {
            user = {
              name = "Anton Riedel";
              email = "anton.riedel@cern.ch";
            };
            core = {
              sshCommand = "ssh -i ~/.ssh/key/github_cern";
            };
          };
        }
        {
          contentSuffix = "alice";
          condition = "gitdir:~/nextcloud/PhD/";
          contents = {
            user = {
              name = "Anton Riedel";
              email = "anton.riedel@cern.ch";
            };
            core = {
              sshCommand = "ssh -i ~/.ssh/key/github_cern";
            };
          };
        }
        {
          contentSuffix = "private";
          condition = "gitdir:~/nixdots/";
          contents = {
            user = {
              name = "Anton Riedel";
              email = "anton.riedel@tum.de";
            };
            core = {
              sshCommand = "ssh -i ~/.ssh/key/github";
            };
          };
        }
        {
          contentSuffix = "private";
          condition = "gitdir:~/Secfiles/";
          contents = {
            user = {
              name = "Anton Riedel";
              email = "anton.riedel@tum.de";
            };
            core = {
              sshCommand = "ssh -i ~/.ssh/key/crystal";
            };
          };
        }
        {
          contentSuffix = "admin";
          condition = "gitdir:~/admin/";
          contents = {
            user = {
              name = "Anton Riedel";
              email = "anton.riedel@tum.de";
            };
            core = {
              sshCommand = "ssh -i ~/.ssh/key/lrzgitlab";
            };
          };
        }
      ];
    };
  };
}
