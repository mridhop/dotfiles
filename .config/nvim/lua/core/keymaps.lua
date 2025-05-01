-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
-- noremap = don't remap
-- silent = don't show command on command line
local opts = { noremap = true, silent = true }

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- Save file without autoformat
vim.keymap.set('n', '<leader>fs', '<cmd>noautocmd w <CR>', { unpack(opts), desc = 'Save without formatting' })

-- Quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<leader>x', ':bdelete<CR>', { unpack(opts), desc = 'Close buffer' }) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', { unpack(opts), desc = 'New buffer' }) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>wv', '<C-w>v', { unpack(opts), desc = 'Split [w]indow [v]ertically' }) -- split window vertically
vim.keymap.set('n', '<leader>wh', '<C-w>s', { unpack(opts), desc = 'Split [w]indow [h]orizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>we', '<C-w>=', { unpack(opts), desc = 'Split [w]indow [e]qual width and height' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>wq', ':close<CR>', { unpack(opts), desc = 'Split [w]indow [q]uit' }) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>wto', ':tabnew<CR>', { unpack(opts), desc = 'Open new tab' })
vim.keymap.set('n', '<leader>wtx', ':tabclose<CR>', { unpack(opts), desc = 'Close current tab' })
vim.keymap.set('n', '<leader>wtn', ':tabn<CR>', { unpack(opts), desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>wtp', ':tabp<CR>', { unpack(opts), desc = 'Go to previous tab' })

-- Toggle line wrapping
vim.keymap.set('n', '<leader>tl', '<cmd>set wrap!<CR>', { unpack(opts), desc = '[T]oggle [L]ine wrapping' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Vim motions
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)
