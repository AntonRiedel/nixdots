# home-modules/tmux/tmux.nix
{...}: {
  flake.modules.homeManager.tmux = {pkgs, ...}: {
    programs.tmux = {
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
      plugins = with pkgs.tmuxPlugins; [
        yank
        extrakto
        fingers
      ];
      extraConfig = ''
        # splits
        unbind '"'
        unbind %
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"

        # smart-splits.nvim — pane navigation (M-hjkl)
        bind -n M-h if -F "#{@pane-is-vim}" 'send-keys M-h' 'select-pane -L'
        bind -n M-j if -F "#{@pane-is-vim}" 'send-keys M-j' 'select-pane -D'
        bind -n M-k if -F "#{@pane-is-vim}" 'send-keys M-k' 'select-pane -U'
        bind -n M-l if -F "#{@pane-is-vim}" 'send-keys M-l' 'select-pane -R'

        # window navigation
        bind -n M-p previous-window
        bind -n M-n next-window

        # vi copy mode
        bind -T copy-mode-vi v send -X begin-selection
        bind -T copy-mode-vi y send -X copy-selection-and-cancel

        # truecolor
        set-option -g default-terminal 'tmux-256color'
        set -ag terminal-overrides ",*:RGB"

        # status bar
        set -g status-right '%H:%M'
        set -g status-left '[#S] '
      '';
    };
    home.file.".config/tmuxp" = {
      source = ./tmuxp;
      recursive = true;
    };
  };
}
