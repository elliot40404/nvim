local plugins = {
  {
    'github/copilot.vim',
    lazy = false,
  },
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
  {
    'folke/trouble.nvim',
    lazy = 'VeryLazy',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>tt',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>tT',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>ts',
        '<cmd>Trouble symbols toggle focus=false win.position=left<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>tl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>tL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>tQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    lazy = false,
  },
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon',
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim',
    },
  },
  {
    'fatih/vim-go',
    ft = 'go',
  },
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    opts = {
      skip_confirm_for_simple_edits = true,
      columns = {
        'icon',
        'permissions',
        'size',
        'mtime',
      },
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- config = function()
    --   require('oil').setup()
    --
  },
  {
    'NeogitOrg/neogit',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      'nvim-telescope/telescope.nvim', -- optional
      -- 'ibhagwan/fzf-lua', -- optional
    },
    config = true,
  },
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    config = function()
      require('auto-session').setup {
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        session_lens = {
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
          buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session when a new one is loaded
        },
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          -- theme = 'everblush',
          theme = 'tokyonight',
          -- theme = 'rose-pine',
        },
      }
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'mg979/vim-visual-multi',
    event = 'BufEnter',
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  -- {
  --   'supermaven-inc/supermaven-nvim',
  --   event = { 'BufEnter' },
  --   config = function()
  --     require('supermaven-nvim').setup {
  --       keymaps = {
  --         accept_suggestion = '<M-l>',
  --         accept_word = '<M-L>',
  --       },
  --       ignore_filetypes = { 'env' },
  --       condition = function()
  --         return false
  --       end,
  --     }
  --   end,
  -- },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Add to harpoon' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon quick menu' })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = 'Select first harpoon' })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = 'Select second harpoon' })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = 'Select third harpoon' })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = 'Select fourth harpoon' })
      vim.keymap.set('n', '<leader>5', function()
        harpoon:list():select(5)
      end, { desc = 'Select fifth harpoon' })
      vim.keymap.set('n', '<leader>6', function()
        harpoon:list():select(6)
      end, { desc = 'Select sixth harpoon' })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup()
    end,
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      dashboard = { enabled = true },
      picker = { enabled = true },
      indent = {
        priority = 1,
        enabled = true,
        only_scope = true,
        only_current = true,
      },
    },
    keys = {
      {
        '\\',
        function()
          Snacks.explorer()
        end,
        desc = 'File Explorer',
      },
    },
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  {
    'ojroques/nvim-osc52',
    config = function()
      require('osc52').setup {
        max_length = 0,
        silent = false,
        trim = false,
      }
      local function copy()
        if (vim.v.event.operator == 'y') and vim.v.event.regname == '' then
          require('osc52').copy_register ''
        end
      end
      vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })
    end,
  },
}

return plugins
