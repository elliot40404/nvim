return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        -- markdown = { 'markdownlint' },
        -- sql = { 'sqlfluff' },
        python = { 'ruff', 'mypy' },
        go = { 'revive' },
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
      }
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
      vim.keymap.set('n', '<leader>l', function()
        require('lint').try_lint()
      end, { desc = '[L]int current buffer' })
    end,
  },
}
