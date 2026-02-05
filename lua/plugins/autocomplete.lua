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
    opts_extend = { 'sources.default' },
  },
}
