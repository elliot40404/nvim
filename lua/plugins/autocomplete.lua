return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', 'mikavilpas/blink-ripgrep.nvim' },
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        menu = {
          border = 'rounded',
          draw = {
            columns = {
              { 'label', 'label_description', gap = 2 },
              { 'kind_icon', 'kind', 'source_name', gap = 2 },
            },
          },
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        documentation = { auto_show = true, auto_show_delay_ms = 50, window = { border = 'rounded' } },
        ghost_text = { enabled = true },
      },
      sources = {
        default = { 'lsp', 'snippets', 'path', 'buffer', 'ripgrep' },
        providers = {
          ripgrep = {
            module = 'blink-ripgrep',
            name = 'Ripgrep',
            opts = {},
          },
        },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true, window = { border = 'rounded' } },
    },
    config = function(_, opts)
      if jit.os == 'Windows' then
        opts.keymap = vim.tbl_deep_extend('force', opts.keymap or {}, {
          ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
          ['<C-@>'] = { 'show', 'show_documentation', 'hide_documentation' },
          ['<C-n>'] = { 'show', 'select_next', 'fallback' },
        })
      end

      require('blink.cmp').setup(opts)

      vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { link = 'NormalFloat' })
      vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { link = 'FloatBorder' })
      vim.api.nvim_set_hl(0, 'BlinkCmpDoc', { link = 'NormalFloat' })
      vim.api.nvim_set_hl(0, 'BlinkCmpDocBorder', { link = 'FloatBorder' })
      vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelp', { link = 'NormalFloat' })
      vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { link = 'FloatBorder' })
    end,
    opts_extend = { 'sources.default' },
  },
}
