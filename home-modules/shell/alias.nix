{ ... }:
{
  home.shellAliases = {
    devEnv = "nix develop $HOME/cernbox/devEnvs/default";
    ls = "ls --color";
    ll = "ls -la";
    sshc = ''
      ssh "$(grep -r "^Host " $HOME/.ssh/config.d | grep -v "git\|\*" | uniq | awk '{print $2}' | fzf --prompt="Connect to host: ")"
    '';
    rr = "rsync -auhcz --partial --info=progress2";
    nmf = ''
      nmcli connection up "$(nmcli connection show | cut -d" " -f1 | tail -n +2 | fzf)"
    '';
  };
}
