return {
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        -- JS/TS
        -- if vim.bo[bufnr].filetype == 'javascript' or vim.bo[bufnr].filetype == 'typescript' then
        --   -- organize imports
        --   -- vim.lsp.buf.execute_command { command = '_typescript.organizeImports', arguments = { vim.fn.expand '%:p' } }
        --   -- TODO: add missing imports
        --   -- TODO: auto fix all fixable
        --   local cmds = {
        --     'EslintFixAll',
        --   }
        --   for _, cmd in ipairs(cmds) do
        --     if vim.fn.exists(':' .. cmd) == 1 then
        --       vim.cmd(cmd)
        --     end
        --   end
        -- end

        return {
          timeout_ms = 5000,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        go = { 'gofumpt', 'goimports-reviser' },
        rust = { 'rustfmt' },
        python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
      },
    },
  },
}
