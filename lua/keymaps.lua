-- Diagnostic keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', 'H', '^', { desc = 'Move to start of line' })
vim.keymap.set('n', 'L', 'g_', { desc = 'Move to end of line' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Normal mode keymaps
vim.keymap.set('n', 'p', 'p`[', { desc = 'paste and go to paste end' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search' })
vim.keymap.set('n', '<leader>ww', ':set wrap!<CR>', { desc = 'Toggle word wrap' })
vim.keymap.set('n', '<leader>or', ':OverseerRun<CR>', { desc = 'OverseerRun' })
vim.keymap.set('n', '<leader>ot', ':OverseerToggle<CR>', { desc = 'OverseerToggle' })
vim.keymap.set('n', '<leader>d', '*#', { desc = 'select current word without jumping forward' })
vim.keymap.set('n', '<leader>n', ':Neogit<CR>', { desc = 'Open Neogit' })

vim.keymap.set('n', '<leader>cn', ':cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<leader>cp', ':cprev<CR>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', '<leader>cc', ':cclose<CR>', { desc = 'Close quickfix list' })
vim.keymap.set('n', '<leader>co', ':copen<CR>', { desc = 'Open quickfix list' })

vim.keymap.set('n', '<M-n>', function()
  require('trouble').next { skip_groups = true, jump = true }
end, { desc = 'trouble next' })
vim.keymap.set('n', '<M-p>', function()
  local trouble = require 'trouble'
  trouble.prev { skip_groups = true, jump = true }
end, { desc = 'trouble prev' })

vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'file copy whole' })
vim.keymap.set('n', '<leader>ls', function()
  vim.lsp.buf.signature_help()
end, { desc = 'Show signature help' })
-- comments
if jit.os == 'Windows' or jit.os == 'OSX' then
  vim.keymap.set('n', '<C-_>', function()
    vim.api.nvim_input 'gcc'
  end, { desc = 'Comment line' })
  vim.keymap.set('v', '<C-_>', function()
    vim.api.nvim_input 'gc'
  end, { desc = 'Comment line' })
  vim.keymap.set('i', '<C-_>', function()
    vim.api.nvim_input '<C-[>gcc==A'
  end, { desc = 'Comment line' })
else
  vim.keymap.set('n', '<C-/>', function()
    vim.api.nvim_input 'gcc'
  end, { desc = 'Comment line' })
  vim.keymap.set('v', '<C-/>', function()
    vim.api.nvim_input 'gc'
  end, { desc = 'Comment line' })
  vim.keymap.set('i', '<C-/>', function()
    vim.api.nvim_input '<C-[>gcc==A'
  end, { desc = 'Comment line' })
end

-- Visual mode keymaps

vim.keymap.set('v', 'J', ":move '>+1<cr>gv=gv", { desc = 'move line down' })
vim.keymap.set('v', 'K', ":move '<-2<CR>gv=gv", { desc = 'Move line up' })

vim.keymap.set('n', '-', function()
  vim.cmd 'Oil --float'
end, { desc = 'Open parent directory' })

vim.keymap.set('n', '<leader>\\', function()
  local oil = require 'oil'
  if vim.g.oil_open then
    oil.close()
    vim.g.oil_open = false
    return
  end
  oil.toggle_float()
  vim.g.oil_open = true
end, { desc = 'Toggle Oil' })

vim.keymap.set('i', '<M-l>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = 'Copilot Accept',
})

vim.keymap.set('i', '<M-L>', 'copilot#AcceptWord("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = 'Copilot Accept Word',
})

vim.keymap.set('n', '<leader>cs', function()
  vim.cmd 'Telescope session-lens'
end, { desc = 'Switch Session' })

vim.keymap.set('i', '<M-i>', function()
  vim.lsp.buf.signature_help()
end, { desc = 'Show signature help' })

vim.keymap.set('i', '<M-j>', '<Esc>o', { desc = 'Insert new line below' })
vim.keymap.set('i', '<M-k>', '<Esc>O', { desc = 'Insert new line above' })

vim.keymap.set('n', '<tab>', function()
  vim.cmd 'BufferLineCycleNext'
end, { desc = 'Switch to next buffer' })
vim.keymap.set('n', '<S-tab>', function()
  vim.cmd 'BufferLineCyclePrev'
end, { desc = 'Switch to previous buffer' })
vim.keymap.set('n', '<leader>x', function()
  vim.cmd 'bd!'
end, { desc = 'Close current buffer' })

vim.keymap.set('n', '<leader>cb', function()
  vim.cmd 'BufferLineCloseOthers'
end, { desc = 'Close all Buffers but current one' })

vim.keymap.set('n', '<leader>cB', function()
  vim.fn.setreg('+', vim.fn.system 'git rev-parse --abbrev-ref HEAD')
end, { desc = 'Copy git branch name' })

function SendToQex()
  local ls = vim.fn.line "'<"
  local le = vim.fn.line "'>"
  local lines = vim.fn.getline(ls, le)
  local content = table.concat(lines, '\n')
  local qex_output = vim.fn.tempname()
  local is_windows = vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1
  local cmd
  if is_windows then
    cmd = string.format('powershell -Command "qex | Tee-Object -FilePath %s"', qex_output)
  else
    cmd = string.format('qex | tee %s', qex_output)
  end
  vim.cmd('split | terminal ' .. cmd)
  local term_buf = vim.api.nvim_get_current_buf()
  vim.defer_fn(function()
    local chan_id = vim.b.terminal_job_id
    if chan_id then
      vim.api.nvim_create_autocmd('TermClose', {
        buffer = term_buf,
        callback = function()
          vim.api.nvim_buf_delete(term_buf, { force = true })
          vim.defer_fn(function()
            local file = io.open(qex_output, 'r')
            if file then
              local content = file:read '*all'
              file:close()
              vim.cmd 'enew'
              local buf = vim.api.nvim_get_current_buf()
              vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
              vim.api.nvim_buf_set_option(buf, 'bufhidden', 'hide')
              vim.api.nvim_buf_set_option(buf, 'swapfile', false)
              vim.api.nvim_buf_set_option(buf, 'filetype', 'json')
              local lines = {}
              local start_json = false
              for line in content:gmatch '[^\r\n]+' do
                -- Start collecting lines once we see the opening bracket
                if line:match '%[' then
                  start_json = true
                end
                if start_json then
                  table.insert(lines, line)
                end
              end
              vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
              vim.fn.delete(qex_output)
            end
          end, 100)
        end,
        once = true,
      })
      vim.fn.chansend(chan_id, content .. '\n')
      vim.cmd 'startinsert'
    end
  end, 100)
end

vim.keymap.set('v', '<leader>e', ':lua SendToQex()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>od', function()
  if vim.g.IS_OPEN == 1 then
    vim.cmd 'DiffviewClose'
    vim.g.IS_OPEN = 0
  else
    vim.cmd 'DiffviewOpen'
    vim.g.IS_OPEN = 1
  end
end, { desc = '[O]pen [D]iffview' })

vim.keymap.set('n', '<leader>y', 'y$', { desc = '[Y]ank till $' })
vim.keymap.set('n', '<leader>dd', '"_dd', { desc = '[D]elete to void' })
vim.keymap.set('n', '[t', ':tabnext<CR>', { desc = 'Go to next [t]ab' })
vim.keymap.set('n', ']t', ':tabprevious<CR>', { desc = 'Go to previous [t]ab' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move right in insert' })
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left in insert' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down in insert' })
vim.keymap.set('n', '<M-b>', ':enew<CR>', { desc = 'new buffer' })
vim.keymap.set('n', '<leader>cx', function()
  vim.ui.input({ prompt = 'CMD: ' }, function(input)
    if input then
      local result = vim.fn.system(input)
      vim.fn.setqflist({}, ' ', {
        title = 'System Command Result',
        lines = vim.split(result, '\n'),
      })
      vim.cmd 'copen'
    end
  end)
end, { desc = 'Exec system command and fill quickfix list with result' })
vim.keymap.set('n', '<leader>sg', function()
  vim.ui.input({ prompt = 'Search: ' }, function(input)
    if input then
      vim.cmd('CtrlSF ' .. input)
    end
  end)
end, { desc = 'Global search and replace' })
