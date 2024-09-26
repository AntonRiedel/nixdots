{ ... }:
{
  home.shellAliases = {
    ls = "ls --color";
    ll = "ls -la";
    tt = "trash put";
    tr = "trash list | fzf --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs trash restore --match=exact --force";
    sshc = ''
      ssh "$(grep -r "^Host " $HOME/.ssh/config.d | grep -v "git\|\*" | awk '{print $2}' | fzf --prompt="Connect to host: ")"
    '';
    rr = "rsync -auhcz --partial --info=progress2";
    nmf = ''
      nmcli connection up "$(nmcli connection show | cut -d" " -f1 | tail -n +2 | fzf)"
    '';
  };
}
