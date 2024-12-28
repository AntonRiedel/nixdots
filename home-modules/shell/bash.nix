{
  ...
}:
{
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
        PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 28)\]\h\[$(tput setaf 1)\]]\[$(tput setaf 7)\] \[$(tput setaf 5)\]\w
        > \[$(tput sgr0)\]"

        if (env | grep -Fq 'CONTAINER_ID'); then
        	PS1="($CONTAINER_ID)$PS1"
        	export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
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
        "ignoreboth"
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
    readline = {
      enable = true;
      extraConfig = ''
        set editing-mode vi
        #set keymap vi
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
  };
  home.sessionVariables = {
    GIT_ASKPASS = "";
  };
}
