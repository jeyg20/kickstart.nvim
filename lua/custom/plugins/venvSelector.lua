return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } },
  },
  lazy = false,
  branch = 'regexp',
  config = function()
    require('venv-selector').setup {
      settings = {
        search = {
          mamba_envs = {
            command = "find ~/anaconda3/envs/ -type d -name 'bin' -exec test -e '{}/python' ';' -print",
          },
        },
      },
    }
  end,
  keys = {
    { ',v', '<cmd>VenvSelect<cr>' },
  },
}
