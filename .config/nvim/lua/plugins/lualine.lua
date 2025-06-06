return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'gruvbox_dark',
        -- disabled_filetypes = {
        --   statusline = {
        --     'neo-tree',
        --     'neo-tree-popup',
        --   },
        -- },
      },
      tabline = {
        lualine_z = { 'tabs' },
      },
      extensions = {
        'neo-tree',
      },
    }
  end,
}
