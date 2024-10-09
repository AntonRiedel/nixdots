{ ... }:
{
  programs = {
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
        set -ag terminal-overrides ",*:RGB"
      '';
    };
  };
  home.file = {
    ".config/tmuxp" = {
      source = ./tmuxp;
      recursive = true;
    };
  };
}
