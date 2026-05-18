# home-modules/shell/bash.nix
{ ... }:
{
  flake.modules.homeManager.bash =
    { ... }:
    {
      programs.bash = {
        enable = true;
        enableCompletion = true;
        bashrcExtra = ''
          # Prompt
          PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 28)\]\h\[$(tput setaf 1)\]]\[$(tput setaf 7)\] \[$(tput setaf 5)\]\w
          > \[$(tput sgr0)\]"

          # Container-specific setup
          if env | grep -Fq 'CONTAINER_ID'; then
            PS1="($CONTAINER_ID)$PS1"
            export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
            export ALICE="$HOME/alice"
            export ALIBUILD_WORK_DIR="$ALICE/sw"
            eval "$(alienv shell-helper)"
          fi
        '';
        shellOptions = [
          "histappend"
          "autocd"
          "cdspell"
          "extglob"
          "nocaseglob"
        ];
        historyFile = "$HOME/.config/bash_history";
        historyControl = [
          "erasedups"
          "ignorespace"
        ];
        historyIgnore = [
          "ls"
          "ll"
          "cd"
          "exit"
          "clear"
          "nvim"
          "vim"
          "vi"
        ];
      };

      programs.readline = {
        enable = true;
        extraConfig = ''
          set editing-mode vi
          TAB:menu-complete
          "\C-l": clear-screen
          set menu-complete-display-prefix On
          set colored-stats On
          set completion-ignore-case On
          set completion-prefix-display-length 3
          set mark-symlinked-directories On
          set show-all-if-ambiguous On
          set show-all-if-unmodified On
          set visible-stats On
        '';
      };

      home.shellAliases = {
        devEnv = "nix develop $HOME/cernbox/devEnvs/default";
        ls = "ls --color";
        ll = "ls -la";
        tt = "trash put";
        tr = "trash list | fzf --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs trash restore --match=exact --force";
        sshc = ''
          ssh "$(grep -r "^Host " $HOME/.ssh/config.d | grep -v "git\|\*" | uniq | awk '{print $2}' | fzf --prompt="Connect to host: ")"
        '';
        rr = "rsync -auhcz --partial --info=progress2";
        nmf = ''
          nmcli connection up "$(nmcli connection show | cut -d" " -f1 | tail -n +2 | fzf)"
        '';
      };

    };
}
