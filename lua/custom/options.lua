-- Indentation Options
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.scrolloff = 10
vim.opt.colorcolumn = '120'
-- Terminal Options
vim.opt.shell = vim.fn.executable 'pwsh -nol' and 'pwsh -nol' or 'powershell'
vim.opt.shellcmdflag =
  '-nologo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellquote = ''
vim.opt.shellxquote = ''
-- additonal file types
vim.filetype.add {
  extension = {
    templ = 'templ',
  },
}
-- copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
-- snippets --
vim.g.lua_snippets_path = vim.fn.stdpath 'config' .. '\\lua\\custom\\snippets'
