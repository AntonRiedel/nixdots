local builtin = require "telescope.builtin"
vim.keymap.set("n", "<space><space>", builtin.find_files)
vim.keymap.set("n", "<space>ff", builtin.find_files)
vim.keymap.set("n", "<space>fl", builtin.live_grep)
vim.keymap.set("n", "<space>fb", builtin.buffers)
vim.keymap.set("n", "<space>fh", builtin.help_tags)
vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<space>gw", builtin.grep_string)
