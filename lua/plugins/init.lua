local plugins = {}

local plugin_dir = debug.getinfo(1, 'S').source:match '@?(.*/)'
for _, file in ipairs(vim.fn.glob(plugin_dir .. '*.lua', true, true)) do
  if not file:match 'init.lua$' then
    local module_name = 'plugins.' .. file:match '([^/]+)%.lua$'
    local ok, extra_plugins = pcall(require, module_name)
    if ok then
      vim.list_extend(plugins, extra_plugins)
    else
      print('Error loading plugin module:', module_name, extra_plugins)
    end
  end
end

return plugins
