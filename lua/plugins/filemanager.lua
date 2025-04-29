return {
  {
    'stevearc/oil.nvim',
    -- event = 'VeryLazy',
    opts = {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      delete_to_trash = true,
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
  ---@type LazySpec
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    dependencies = {
      'folke/snacks.nvim',
    },
    keys = {
      {
        '<leader>-',
        mode = { 'n', 'v' },
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        '<leader>cw',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
      -- {
      --   '<c-up>',
      --   '<cmd>Yazi toggle<cr>',
      --   desc = 'Resume the last yazi session',
      -- },
    },
    ---@type YaziConfig | {}
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
