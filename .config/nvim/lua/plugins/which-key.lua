-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
  opts = {
    preset = 'modern',
    icons = {
      group = '',
      mappings = false,
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)

    wk.add {
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>w', group = '[W]indows and Tabs' },
      { '<leader>wt', group = '[T]abs' },
      { '<leader>f', group = '[F]ormat' },
      { '[b', desc = 'Previous buffer' },
      { ']b', desc = 'Next buffer' },
    }
  end,
}
