{ ... }:
{
  flake.modules.homeManager.alias =
    { ... }:
    {
      home.shellAliases = {
        nixroot = "nix develop $HOME/nixdots#nixroot";
        ls = "ls --color";
        ll = "ls -la";
        rr = "rsync -auhcz --partial --info=progress2";
        sshc = ''ssh "$(grep -r "^Host " $HOME/.ssh/config.d | grep -v "git\|\*" | uniq | awk '{print $2}' | fzf --prompt="Connect to host: ")"'';
        nmf = ''nmcli connection up "$(nmcli connection show | cut -d" " -f1 | tail -n +2 | fzf)"'';
      };
    };
}
