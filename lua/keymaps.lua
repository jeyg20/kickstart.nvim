vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- 'Black hole register' Delete text whitout storing it in the register or clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

-- Set an autocmd to show diagnostics when the cursor is held on a line
vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  callback = function()
    vim.diagnostic.open_float(nil, { scope = 'line', border = 'rounded' })
  end,
})

vim.keymap.set('n', '<leader>tc', function()
  if vim.bo.filetype == 'python' then
    require('dap-python').test_class()
  end
end)

vim.keymap.set('n', '<leader>tm', function()
  if vim.bo.filetype == 'python' then
    require('dap-python').test_method()
  end
end)
-- vim: ts=2 sts=2 sw=2 et

-- Navigation
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Move selected lines up & down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Join lines but keep cursor in place with J
vim.keymap.set('n', 'J', 'mzJ`z')

-- Scroll down/up half a page and center cursor
vim.keymap.set('n', '<C-k>', '<C-d>zz')
vim.keymap.set('n', '<C-j>', '<C-u>zz')

-- Next/previous search result and center cursor
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Restart LSP server with <leader>zig
vim.keymap.set('n', '<leader>lsp', '<cmd>LspRestart<cr>')

-- "Greatest remap ever": paste over selection without yanking it
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Map <leader>xh to view buffer as hex with xxd
vim.keymap.set('n', '<Leader>xh', ':%!xxd<CR>', {
  noremap = true, -- Non-recursive mapping
  silent = true, -- Don't echo the command
  desc = 'View buffer as hex (xxd)', -- Description for which-key etc.
})

-- Map <leader>xr to revert buffer from hex with xxd -r
vim.keymap.set('n', '<Leader>xr', ':%!xxd -r<CR>', {
  noremap = true,
  silent = true,
  desc = 'Revert buffer from hex (xxd -r)',
})
