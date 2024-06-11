{ inputs, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    fd
    ripgrep
    bat
    trashy
    xdg-utils
    sshpass
  ];

  home.shellAliases = {
    ll = "ls -la";
    tt = "trash put";
    tr = "trash list | fzf --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs trash restore --match=exact --force";
    sshc = ''
ssh "$(grep -r "^Host " $HOME/.ssh/config.d | grep -v "git\|\*" | awk '{print $2}' | fzf --prompt="Connect to host: ")"
'';
    rr ="rsync -auhcz --partial --info=progress2";
    nmf = ''
nmcli connection up "$(nmcli connection show | cut -d" " -f1 | tail -n +2 | fzf)"
'';
  };

  programs = {
    bash = {
        enable = true;
	enableCompletion = true;
        bashrcExtra = ''
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 28)\]\h\[$(tput setaf 1)\]]\[$(tput setaf 7)\] \[$(tput setaf 5)\]\w
> \[$(tput sgr0)\]"

if (env | grep -Fq 'DISTROBOX'); then
PS1="(Container)$PS1"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi
'';
#         initExtra = ''
# '';
        profileExtra = ''
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
	. ~/.nix-profile/etc/profile.d/nix.sh
fi
'';
        shellOptions = [ "histappend" "autocd" "extglob" "nocaseglob" ];
	historyFile = "$HOME/.config/bash_history";
	historyControl = [ "erasedups" ];	
	historyIgnore = [ "ls" "ll" "cd" "exit" "clear" ];
      };
    readline = {
      enable = true;
      extraConfig = ''
TAB:menu-complete
C-l:clear-screen
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
    zsh = {
        enable = true;
	autosuggestion.enable = true;
	enableCompletion = true;
	autocd = true;
	dotDir = ".config/zsh";
	history = {
          extended = true;
	  ignoreAllDups = true;
	  path = ".config/zsh/history";
	  share = true;
	};
	initExtraFirst = ''
#prompt
PS1="%B[%F{cyan}%n%f@%F{yellow}%M%f] %F{red}%~%f
%F{magenta}>%f%b "
'';
        completionInit = ''
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
'';
        initExtra = ''
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#fix backspace bug
bindkey "^?" backward-delete-char

#include hidden files in autocomplete:
_comp_options+=(globdots)

#enable case INsensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
'';
        profileExtra = ''
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
	. ~/.nix-profile/etc/profile.d/nix.sh
fi
'';
        syntaxHighlighting.enable =  true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      changeDirWidgetCommand = "fd --type d";
      changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'" ];
      fileWidgetCommand = "fd --type f";
      fileWidgetOptions = [ "--preview 'head {}'"];
      historyWidgetOptions = [ "--sort" "--exact" ];
      defaultCommand = "fd --type f";
      defaultOptions = [ "--height 40%" "--border" ];
    };
    tmux = {
      enable = true;
      baseIndex = 1;
      clock24 = true;
      keyMode = "vi";
      mouse = true;
      newSession = true;
      escapeTime = 10;
      prefix = "C-a";
      sensibleOnTop = true;

      tmuxp.enable = true;
      extraConfig = ''
# split panes using | and - and keep the current directory
unbind '"'
unbind %
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# switch panes using Alt-{h,j,k,l} without prefix
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D

# switch windows using Alt-{n,p}
bind -n M-p previous-window
bind -n M-n next-window

# enable truecolor support
set-option -g default-terminal 'tmux-256color'
set-option -sa terminal-features ',xterm-kitty:RGB'
'';
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    

    helix = {
      enable = true;
    };
  };

  # home.file = {
  #   ".config/nvim/init.lua".source = ./nvim/init.lua;
  # };

  home.sessionVariables = {
    VISUAL = "nvim";
  };
}
