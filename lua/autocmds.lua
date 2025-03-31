vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  pattern = { '*.py' },
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})

vim.api.nvim_create_augroup('DashboardAutoOpen', { clear = true })
vim.api.nvim_create_autocmd({ 'BufDelete' }, {
  group = 'DashboardAutoOpen',
  callback = function()
    vim.schedule(function()
      local buffers = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted and vim.api.nvim_buf_get_name(buf) ~= ''
      end, vim.api.nvim_list_bufs())
      if #buffers == 0 then
        vim.cmd 'lua Snacks.dashboard()'
      end
    end)
  end,
})
