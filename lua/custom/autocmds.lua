-- set up autocmd to fix all fixable errors and organize imports on save typescript and javascript files
-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
-- vim.api.nvim_clear_autocmds {
--   group = augroup,
-- }
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
--   -- augroup = augroup,
--   callback = function()
--     vim.cmd [[
--       augroup lsp_typescript
--         autocmd!
--         autocmd BufWritePre <buffer> lua vim.cmd "TSToolsFixAll"
--         autocmd BufWritePre <buffer> lua vim.cmd "TSToolsOrganizeImports"
--       augroup END
--     ]]
--   end,
-- })

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

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     local bufnr = args.buf
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if vim.tbl_contains({ 'null-ls' }, client.name) then -- blacklist lsp
--       return
--     end
--     require('lsp_signature').on_attach({
--       -- ... setup options here ...
--     }, bufnr)
--   end,
-- })
