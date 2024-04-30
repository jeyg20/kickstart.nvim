return {
  'mbbill/undotree',

  config = function()
    vim.keymap.set('n', '<leader>f', vim.cmd.UndotreeToggle)
  end,
}
