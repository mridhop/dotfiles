return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<c-\>]],
    direction = 'float',
  },
  config = function(_, opts)
    local term = require 'toggleterm'
    local keyopts = { noremap = true, silent = true }

    term.setup(opts)

    vim.keymap.set('n', [[<leader>\t]], [[<cmd>ToggleTerm direction=float<CR>]], { unpack(keyopts), desc = 'Toggle floating terminal' })
    vim.keymap.set('t', '<Esc>', [[<C-\><C-N>]], { unpack(opts), desc = 'Exit to normal mode' })
    vim.keymap.set('t', '<C-[>', [[<C-\><C-N>]], { unpack(opts), desc = 'Exit to normal mode (ctrl-[)' })
    vim.keymap.set('n', [[<leader>\a]], [[<cmd>ToggleTermToggleAll<CR>]], { unpack(keyopts), desc = 'Toggle all open/closed terminal(s)' })
    vim.keymap.set('n', [[<leader>\v]], function()
      return '<cmd>' .. vim.v.count .. 'ToggleTerm direction=vertical<CR>'
    end, { expr = true, unpack(keyopts), desc = 'Open new vertical terminal' })
    vim.keymap.set('n', [[<leader>\h]], function()
      return '<cmd>' .. vim.v.count .. 'ToggleTerm direction=horizontal<CR>'
    end, { expr = true, unpack(keyopts), desc = 'Open new horizontal terminal' })
  end,
}
