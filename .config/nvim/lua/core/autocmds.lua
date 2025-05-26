local group = vim.api.nvim_create_augroup('WezTermTitle', { clear = true })

if vim.env.TERM_PROGRAM == 'WezTerm' or vim.env.WEZTERM_EXECUTABLE then
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufFilePost', 'BufWritePost' }, {
    group = group,
    callback = function()
      local title = 'vim'
      local bufname = vim.fn.expand '%:t'

      if bufname ~= '' then
        title = string.format('vim: %s', bufname)
      end

      local ok, _ = pcall(vim.fn.system, { 'wezterm', 'cli', 'set-tab-title', title })
      if not ok then
        vim.notify('Failed to set WezTerm tab title', vim.log.levels.WARN)
      end
    end,
  })

  vim.api.nvim_create_autocmd({ 'VimLeave' }, {
    group = group,
    callback = function()
      vim.fn.system { 'wezterm', 'cli', 'set-tab-title', '' }
    end,
  })
end

-- commentstring for yuck filetype
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'yuck',
  callback = function()
    vim.opt.commentstring = ';; %s'
  end,
})
