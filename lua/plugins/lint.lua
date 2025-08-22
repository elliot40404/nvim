return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      local function has_eslint_config(path)
        local eslint_configs = {
          '.eslintrc.js',
          '.eslintrc.cjs',
          '.eslintrc.json',
          '.eslintrc.yaml',
          '.eslintrc.yml',
          '.eslintrc',
        }
        for _, config in ipairs(eslint_configs) do
          local config_path = path .. '/' .. config
          return vim.fn.filereadable(config_path) == 1
        end
        return false
      end

      local function get_js_ts_linters()
        local root = vim.fn.getcwd()
        if has_eslint_config(root) then
          return { 'eslint_d' }
        end
        return {}
      end

      lint.linters_by_ft = {
        python = { 'mypy' },
        -- go = { 'revive' },
        javascript = get_js_ts_linters(),
        typescript = get_js_ts_linters(),
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
