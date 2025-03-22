local plugins = {}

-- Get the directory containing this file, accounting for platform differences
local plugin_dir = debug.getinfo(1, 'S').source:match('@?(.-)[\\/][^/\\]*$') or ''
if plugin_dir ~= '' then
  -- Normalize to forward slashes for consistency and add trailing slash
  plugin_dir = plugin_dir:gsub('\\', '/')
  if plugin_dir:sub(-1) ~= '/' then
    plugin_dir = plugin_dir .. '/'
  end
end

-- Use vim's built-in glob function which handles platform differences
for _, file in ipairs(vim.fn.glob(plugin_dir .. '*.lua', true, true)) do
  -- Normalize the path to use forward slashes for consistency across platforms
  file = file:gsub('\\', '/')
  if not file:match('init%.lua$') then
    -- Extract the module name by getting the filename without extension
    local module_name = 'plugins.' .. file:match('([^/]+)%.lua$')
    local ok, extra_plugins = pcall(require, module_name)
    if ok then
      vim.list_extend(plugins, extra_plugins)
    else
      print('Error loading plugin module:', module_name, extra_plugins)
    end
  end
end

return plugins
