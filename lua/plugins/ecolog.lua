return {
  {
    'philosofonusus/ecolog.nvim',
    branch = 'beta',
    event = 'BufEnter',
    keys = {
      { '<leader>ge', '<cmd>EcologGoto<cr>', desc = 'Go to env file' },
      { '<leader>ep', '<cmd>EcologPeek<cr>', desc = 'Ecolog peek variable' },
      { '<leader>es', '<cmd>EcologSnacks<cr>', desc = 'Open ecolog picker' },
    },
    lazy = false,
    opts = {
      integrations = {
        nvim_cmp = false,
        blink_cmp = true,
        snacks = {
          shelter = {
            mask_on_copy = false,
          },
          keys = {
            copy_value = '<C-y>',
            copy_name = '<C-u>',
            append_value = '<C-a>',
            append_name = '<CR>',
            edit_var = '<C-e>',
          },
          layout = {
            preset = 'dropdown',
            preview = false,
          },
        },
      },
    },
  },
}
