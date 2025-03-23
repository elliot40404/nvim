local plugins = {
  'tpope/vim-sleuth',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
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
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.align').setup()
      require('mini.comment').setup()
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
    },
  },
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    lazy = 'VeryLazy',
  },
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('auto-session').setup {
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        session_lens = {
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
          buftypes_to_ignore = {},
        },
      }
    end,
  },
  {
    'mg979/vim-visual-multi',
    event = 'BufEnter',
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
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = 'BufEnter',
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
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight',
        },
      }
    end,
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
  },
  {
    'stevearc/overseer.nvim',
    lazy = 'VeryLazy',
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
      words = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
      },
      -- explorer = { enabled = true },
      statuscolumn = { enabled = true },
      indent = {
        priority = 1,
        enabled = true,
        only_scope = true,
        only_current = true,
        animate = {
          enabled = false,
        },
      },
      terminal = {
        win = {
          position = 'float',
          border = 'rounded',
        },
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
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = '[S]earch [H]elp',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = '[S]earch [K]eymaps',
      },
      {
        '<leader>sf',
        function()
          Snacks.picker.files()
        end,
        desc = '[S]earch [F]iles',
      },
      {
        '<leader>ss',
        function()
          Snacks.picker()
        end,
        desc = '[S]earch [S]elect',
      },
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = '[S]earch current [W]ord',
      },
      {
        '<M-/>',
        function()
          Snacks.picker.grep()
        end,
        desc = '[S]earch by [G]rep',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = '[S]earch [D]iagnostics',
      },
      {
        '<leader>sr',
        function()
          Snacks.picker.resume()
        end,
        desc = '[S]earch [R]esume',
      },
      {
        '<leader>b',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Find existing [b]uffers',
      },
      {
        '<leader><leader>',
        function()
          if vim.fn.isdirectory '.git' == 1 then
            Snacks.picker.git_files()
          else
            Snacks.picker.files()
          end
        end,
        desc = '[S]earch [F]iles',
      },
      {
        '<leader>lg',
        function()
          Snacks.lazygit()
        end,
        desc = '[l]azy [g]it',
      },
      {
        '<leader>.',
        function()
          Snacks.scratch()
        end,
        desc = 'Toggle Scratch Buffer',
      },
      {
        '<leader>sb',
        function()
          Snacks.picker.git_branches()
        end,
        desc = '[s]witch git [b]ranch',
      },
      {
        '<leader>gl',
        function()
          Snacks.picker.git_log_line()
        end,
        desc = '[g]it log [l]ine',
      },
      {
        '<leader>gf',
        function()
          Snacks.picker.git_log_file()
        end,
        desc = 'git [l]og [f]ile',
      },
      {
        '<leader>sl',
        function()
          local line = vim.fn.getline '.'
          Snacks.picker.lines {
            search = line,
          }
        end,
        desc = 'Search [L]ine under cursor',
      },
      {
        ']]',
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = 'Next Reference',
        mode = { 'n', 't' },
      },
      {
        '[[',
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = 'Prev Reference',
        mode = { 'n', 't' },
      },
      {
        '<leader>/',
        function()
          Snacks.picker.lines {
            layout = {
              preview = 'main',
              preset = 'vertical',
            },
          }
        end,
        desc = 'search in current buffer',
      },
      {
        '<M-h>',
        function()
          Snacks.terminal.toggle()
        end,
        desc = 'Toggle terminal',
        mode = { 'n', 't' },
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
