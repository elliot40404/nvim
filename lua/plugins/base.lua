local plugins = {
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  'tpope/vim-sleuth',
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      }
    end,
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'echasnovski/mini.nvim',
    event = 'BufEnter',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.align').setup()
      require('mini.comment').setup()
      require('mini.pairs').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    lazy = 'VeryLazy',
    opts = {},
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
      {
        '<A-p>',
        function()
          require('trouble').prev { skip_groups = true, jump = true }
        end,
        desc = 'Previous trouble item',
      },
      {
        '<A-n>',
        function()
          require('trouble').next { skip_groups = true, jump = true }
        end,
        desc = 'Next trouble item',
      },
    },
  },
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    lazy = 'VeryLazy',
  },
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
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight',
        },
        sections = {
          lualine_c = {
            {
              'filename',
              path = 1,
            },
            'filesize',
            'selectioncount',
          },
          lualine_x = { 'lsp_status', 'encoding', 'fileformat', 'filetype' },
        },
      }
    end,
  },
  {
    'stevearc/overseer.nvim',
    lazy = 'VeryLazy',
    cmd = { 'OveseerRun', 'OverseerToggle' },
    opts = {},
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      modes = {
        search = {
          enabled = false,
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
    'dyng/ctrlsf.vim',
    cmd = 'CtrlSF',
    lazy = 'VeryLazy',
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
      },
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'ibhagwan/fzf-lua',
    lazy = 'VeryLazy',
    cmd = { 'FzfLua' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    'rcarriga/nvim-notify',
  },
  {
    'monaqa/dial.nvim',
    lazy = 'BufReadPre',
    keys = {
      { '<C-a>', mode = { 'n', 'v' } },
      { '<C-x>', mode = { 'n', 'v' } },
      { 'g<C-a>', mode = { 'v' } },
      { 'g<C-x>', mode = { 'v' } },
    },
    config = function()
      local augend = require 'dial.augend'
      require('dial.config').augends:register_group {
        default = {
          augend.integer.alias.decimal, -- decimal number
          augend.integer.alias.hex, -- hex number
          augend.date.alias['%Y/%m/%d'], -- date (2022/02/19, etc.)
          augend.constant.alias.bool, -- boolean (true <-> false)
          augend.semver.alias.semver, -- semver (0.1.0, etc.)
          augend.constant.new {
            elements = { 'and', 'or' },
            word = true,
            cyclic = true,
          },
          augend.constant.new {
            elements = { '&&', '||' },
            word = false,
            cyclic = true,
          },
        },
      }
      local map = vim.keymap.set
      map('n', '<C-a>', require('dial.map').inc_normal(), { noremap = true })
      map('n', '<C-x>', require('dial.map').dec_normal(), { noremap = true })
      map('v', '<C-a>', require('dial.map').inc_visual(), { noremap = true })
      map('v', '<C-x>', require('dial.map').dec_visual(), { noremap = true })
      map('v', 'g<C-a>', require('dial.map').inc_gvisual(), { noremap = true })
      map('v', 'g<C-x>', require('dial.map').dec_gvisual(), { noremap = true })
    end,
  },
}

return plugins
