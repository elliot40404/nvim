return {
  {
    'Shatur/neovim-ayu',
    lazy = false,
    priority = 1000,
    config = function()
      require('ayu').setup {
        mirage = false,
        overrides = {
          Normal = { bg = 'None' },
          NormalFloat = { bg = 'None' },
          SignColumn = { bg = 'None' },
          FoldColumn = { bg = 'None' },
          LineNr = { fg = '#6C768A', bg = 'None' },
        },
      }
      vim.cmd.colorscheme 'ayu-dark'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
