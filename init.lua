-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.python3_host_prog = '/home/jeison/anaconda3/envs/conda_env/bin/python'

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.g.python3_host_prog = '/home/jeison/anaconda3/envs/env/bin/python'

-- [[ Setting options ]]
require 'options'
require 'keymaps'
require 'lazy-bootstrap'
