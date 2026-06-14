{...}: {
  flake.modules.homeManager.neovim = {pkgs, ...}: {
    programs.nvf = {
      enable = true;
      settings = {
        vim.viAlias = true;
        vim.vimAlias = true;

        # ── Theme ────────────────────────────────────────────────────────
        vim.theme = {
          enable = true;
          name = "solarized";
          style = "dark";
        };

        # ── Core ─────────────────────────────────────────────────────────
        vim.lsp = {
          enable = true;
          lightbulb.enable = true;
          trouble.enable = true;
        };

        vim.telescope.enable = true;

        vim.autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
        };

        vim.utility.smart-splits.enable = true;
        vim.luaConfigRC.smart-splits = ''
          local ss = require('smart-splits')
          vim.keymap.set('n', '<M-h>', ss.move_cursor_left)
          vim.keymap.set('n', '<M-j>', ss.move_cursor_down)
          vim.keymap.set('n', '<M-k>', ss.move_cursor_up)
          vim.keymap.set('n', '<M-l>', ss.move_cursor_right)
        '';

        vim.statusline.lualine = {
          enable = true;
          theme = "auto";
        };

        vim.clipboard = {
          enable = true;
          registers = "unnamedplus";
          providers.wl-copy.enable = true;
        };

        vim.searchCase = "smart";
        vim.hideSearchHighlight = true; # sets hlsearch = false
        vim.lineNumberMode = "relNumber"; # sets number + relativenumber
        vim.opts = {
          splitbelow = true;
          splitright = true;
          breakindent = true;
          undofile = true;
          cursorline = true;
          cursorlineopt = "number";
          inccommand = "split";
          signcolumn = "yes";
          writebackup = false;
          completeopt = "menuone,noselect";
        };

        vim.visuals.nvim-web-devicons.enable = true;
        vim.visuals.fidget-nvim.enable = true;
        vim.visuals.nvim-cursorline.enable = true;
        vim.visuals.indent-blankline.enable = true;
        vim.autopairs.nvim-autopairs.enable = true;
        vim.comments.comment-nvim.enable = true;
        vim.spellcheck = {
          enable = true;
          languages = ["en" "de"];
        };

        # ── Treesitter ────────────────────────────────────────────────────
        vim.treesitter = {
          enable = true;
          grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            json
            yaml
            toml
            markdown
          ];
        };

        # ── Language modules ──────────────────────────────────────────────
        vim.languages = {
          enableTreesitter = true;
          enableFormat = true;

          nix.enable = true;
          nix.lsp.enable = true;
          nix.format.enable = true;

          python.enable = true;
          python.lsp.enable = true;
          python.format.enable = true;

          clang.enable = true;
          clang.lsp.enable = true;
          clang.format.enable = true;

          rust.enable = true;
          rust.lsp.enable = true;
          rust.format.enable = true;

          lua.enable = true;
          lua.lsp.enable = true;
          lua.format.enable = true;

          bash.enable = true;
          bash.lsp.enable = true;
          bash.format.enable = true;

          tex.enable = true;
          tex.lsp.enable = true;
          tex.format.enable = true;

          typst.enable = true;
          typst.lsp.enable = true;
          typst.format.enable = true;
        };

        # ── Extra packages ────────────────────────────────────────────────
        vim.extraPackages = with pkgs; [
          # LSP servers
          nil
          pyright
          clang-tools
          rust-analyzer
          lua-language-server
          bash-language-server
          texlab
          tinymist
          ansible-language-server
          # formatters
          nixfmt
          black
          stylua
          shfmt
          rustfmt
          jq
          # latexindent is bundled in texlive
          # texlive.combined.scheme-medium
          # Ansible
          ansible-lint
        ];

        # ── Formatting ────────────────────────────────────────────────────
        vim.formatter.conform-nvim = {
          enable = true;
          setupOpts = {
            format_on_save = {
              lsp_fallback = true;
              timeout_ms = 500;
            };
            formatters_by_ft = {
              nix = ["nixfmt"];
              python = ["black"];
              c = ["clang_format"];
              cpp = ["clang_format"];
              rust = ["rustfmt"];
              lua = ["stylua"];
              sh = ["shfmt"];
              bash = ["shfmt"];
              json = ["jq"];
              tex = ["latexindent"];
              # typst formatting is handled by tinymist via the language module
              "_" = ["trim_whitespace"];
            };
          };
        };

        # ── Ansible ───────────────────────────────────────────────────────
        vim.luaConfigRC.ansible = ''
          vim.filetype.add({
            pattern = {
              [".*/tasks/.*%.ya?ml"]     = "yaml.ansible",
              [".*/handlers/.*%.ya?ml"]  = "yaml.ansible",
              [".*/roles/.*%.ya?ml"]     = "yaml.ansible",
              [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
              [".*playbook.*%.ya?ml"]    = "yaml.ansible",
            },
          })

          vim.lsp.config('ansiblels', {
            cmd = { 'ansible-language-server', '--stdio' },
            filetypes = { 'yaml.ansible' },
            root_markers = { 'ansible.cfg', '.ansible-lint', 'galaxy.yml' },
            settings = {
              ansible = {
                ansible = { path = 'ansible' },
                executionEnvironment = { enabled = false },
                python = { interpreterPath = 'python3' },
                validation = {
                  enabled = true,
                  lint = { enabled = true, path = 'ansible-lint' },
                },
              },
            },
          })
          vim.lsp.enable('ansiblels')
        '';

        # ── :Format command ───────────────────────────────────────────────
        vim.luaConfigRC.conform-format-command = ''
          vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
              local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
              range = {
                start = { args.line1, 0 },
                ["end"] = { args.line2, end_line:len() },
              }
            end
            require("conform").format({ async = true, lsp_format = "fallback", range = range })
          end, { range = true })
        '';
      };
    };
  };
}
