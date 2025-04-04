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

-- Create autocommand group for LSP folding
local fold_group = vim.api.nvim_create_augroup('LSPFolding', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = fold_group,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local win = vim.api.nvim_get_current_win()
    if client and client.server_capabilities.foldingRangeProvider then
      vim.wo[win].foldmethod = 'expr'
      vim.wo[win].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})
