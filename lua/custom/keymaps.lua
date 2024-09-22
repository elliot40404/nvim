-- Normal mode keymaps

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search' })
vim.keymap.set('n', '<leader>ww', ':set wrap!<CR>', { desc = 'Toggle word wrap' })
vim.keymap.set('n', '<leader>d', '*#', { desc = 'select current word without jumping forward' })
vim.keymap.set('n', '<leader>pw', function()
  local builtins = require 'telescope.builtin'
  local word = vim.fn.expand '<cword>'
  builtins.grep_string { search = word }
end, { desc = 'Search word under cursor' })
vim.keymap.set('n', '<leader>cn', ':cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<leader>cp', ':cprev<CR>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', '<leader>cc', ':cclose<CR>', { desc = 'Close quickfix list' })
vim.keymap.set('n', '<leader>co', ':copen<CR>', { desc = 'Open quickfix list' })
vim.keymap.set('n', '<M-h>', function()
  vim.cmd 'ToggleTerm direction=float name=terminal'
end, { desc = 'Toggle terminal' })
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'file copy whole' })
vim.keymap.set('n', '<leader>ls', function()
  vim.lsp.buf.signature_help()
end, { desc = 'Show signature help' })
vim.keymap.set('n', '<C-_>', function()
  vim.api.nvim_input 'gcc'
end, { desc = 'Comment line' })
vim.keymap.set('v', '<C-_>', function()
  vim.api.nvim_input 'gc'
end, { desc = 'Comment line' })
vim.keymap.set('i', '<C-_>', function()
  vim.api.nvim_input '<C-[>gcc==A'
end, { desc = 'Comment line' })
-- Terminal mode keymaps
vim.keymap.set('t', '<M-h>', function()
  vim.cmd 'ToggleTerm'
end, { desc = 'Toggle terminal' })

-- Visual mode keymaps

vim.keymap.set('v', 'J', ":move '>+1<cr>gv=gv", { desc = 'move line down' })
vim.keymap.set('v', 'K', ":move '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Plugin keymaps

vim.keymap.set('n', '-', function()
  vim.cmd 'Oil'
end, { desc = 'Open parent directory' })

-- vim.keymap.set('i', '<M-l>', 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false,
--   desc = 'Copilot Accept',
-- })
--
-- vim.keymap.set('i', '<M-L>', 'copilot#AcceptWord("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false,
--   desc = 'Copilot Accept Word',
-- })

vim.keymap.set('n', '<leader>cs', function()
  vim.cmd 'Telescope session-lens'
end, { desc = 'Switch Session' })

vim.keymap.set('i', '<M-i>', function()
  vim.lsp.buf.signature_help()
end, { desc = 'Show signature help' })

-- inset new line below in insert mode
vim.keymap.set('i', '<M-j>', '<Esc>o', { desc = 'Insert new line below' })
vim.keymap.set('i', '<M-k>', '<Esc>O', { desc = 'Insert new line above' })

-- navigate buffers
vim.keymap.set('n', '<tab>', function()
  vim.cmd 'BufferLineCycleNext'
end, { desc = 'Switch to next buffer' })
vim.keymap.set('n', '<S-tab>', function()
  vim.cmd 'BufferLineCyclePrev'
end, { desc = 'Switch to previous buffer' })
vim.keymap.set('n', '<leader>x', function()
  vim.cmd 'bd'
end, { desc = 'Close current buffer' })
