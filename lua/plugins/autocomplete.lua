return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          return 'make install_jsregexp'
        end)(),
        config = function() end,
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      local mysnips = vim.fn.stdpath 'config' .. '/snippets'
      if jit.os == 'Windows' then
        mysnips = mysnips:gsub('\\', '/')
      end
      -- require('luasnip.loaders.from_lua').lazy_load { paths = { mysnips } }
      require('luasnip.loaders.from_vscode').lazy_load { paths = { mysnips } }

      cmp.setup {
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert,noselect' },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'calc' },
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            require('cmp').config.compare.offset,
            require('cmp').config.compare.exact,
            require('cmp').config.compare.score,
            require('cmp').config.compare.kind,
            require('cmp').config.compare.sort_text,
            require('cmp').config.compare.length,
            require('cmp').config.compare.order,
          },
        },
      }
      cmp.setup.filetype({ 'sql' }, {
        sources = {
          { name = 'vim-dadbod-completion' },
          { name = 'buffer' },
        },
      })
    end,
  },
  -- {
  --   'saghen/blink.cmp',
  --   dependencies = { 'rafamadriz/friendly-snippets' },
  --   version = '*',
  --   opts = {
  --     keymap = { preset = 'default' },
  --     appearance = {
  --       nerd_font_variant = 'mono',
  --     },
  --     completion = {
  --       list = {
  --         selection = {
  --           preselect = false,
  --           auto_insert = false,
  --         },
  --       },
  --       documentation = { auto_show = true, auto_show_delay_ms = 100 },
  --       ghost_text = { enabled = true },
  --     },
  --     sources = {
  --       default = { 'lsp', 'path', 'snippets', 'buffer' },
  --     },
  --     fuzzy = { implementation = 'prefer_rust_with_warning' },
  --     signature = { enabled = true },
  --   },
  --   opts_extend = { 'sources.default' },
  -- },
}
