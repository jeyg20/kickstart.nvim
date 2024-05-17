-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.python3_host_prog = './env/bin/python3.11'

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
