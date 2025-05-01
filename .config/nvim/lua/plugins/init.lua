local plugin_specs = {}

-- Get the list of plugin files in this directory
local plugin_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
local plugin_files = vim.fn.glob(plugin_dir .. '/*.lua', false, true)

for _, file in ipairs(plugin_files) do
  local filename = vim.fn.fnamemodify(file, ':t') -- get just the filename
  if filename ~= 'init.lua' then
    local module_name = 'plugins.' .. filename:gsub('%.lua$', '')
    table.insert(plugin_specs, require(module_name))
  end
end

return plugin_specs
