vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
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

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    local function toggle_checkbox()
      local row = vim.api.nvim_win_get_cursor(0)[1] - 1
      local line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]
      if not line then
        return
      end
      if line:find '%[ %]' then
        line = line:gsub('%[ %]', '[x]', 1)
      elseif line:find '%[x%]' then
        line = line:gsub('%[x%]', '[ ]', 1)
      end
      vim.api.nvim_buf_set_lines(0, row, row + 1, false, { line })
    end
    vim.keymap.set('n', '<leader>k', toggle_checkbox, { buffer = true, desc = 'Toggle Markdown Checkbox' })
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.env', '.env', '.env.*', '*.env.*' },
  callback = function()
    vim.cmd 'set filetype=env'
    vim.cmd 'syntax on'
    vim.cmd 'runtime! syntax/sh.vim'
  end,
})
