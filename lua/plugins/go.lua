return {
  {
    'ray-x/go.nvim',
    -- dependencies = { 'ray-x/guihua.lua' },
    config = function()
      require('go').setup {
        lsp_cfg = false,
        lsp_gofumpt = false,
        trouble = true,
        luasnip = true,
      }
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
  },
}
