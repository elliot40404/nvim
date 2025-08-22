return {
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
    keys = {
      {
        '<leader>u',
        '<cmd>RainbowAlign<cr>',
        desc = 'Align',
      },
      {
        '<leader>uu',
        '<cmd>RainbowShrink<cr>',
        desc = 'Shrink',
      },
    },
  },
  -- {
  --   'fatih/vim-go',
  --   ft = 'go',
  -- },
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'catgoose/nvim-colorizer.lua',
    ft = { 'html', 'css' },
    opts = {
      mode = 'virtualtext',
    },
  },
  {
    'OXY2DEV/markview.nvim',
    ft = { 'markdown' },
  },
}
